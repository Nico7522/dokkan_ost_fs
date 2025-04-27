import {
  AfterViewInit,
  Component,
  ElementRef,
  inject,
  input,
  NgZone,
  PLATFORM_ID,
  signal,
  ViewChild,
} from '@angular/core';
import { CardsService } from '@services/cards/cards.service';
import { toObservable } from '@angular/core/rxjs-interop';
import { debounceTime, map, switchMap, tap } from 'rxjs';
import { AsyncPipe, isPlatformBrowser } from '@angular/common';
import { CardComponent } from '@shared/card/card.component';
import { keysToCamel } from '../../../helpers/helpers';
import { NgxSpinnerModule, NgxSpinnerService } from 'ngx-spinner';
import { AnimationComponent } from '@shared/animation/animation.component';
import { environment } from '../../../../environments/environment';
import { AnimationService } from '@services/animation/animation.service';
@Component({
  selector: 'app-card-details',
  standalone: true,
  imports: [AsyncPipe, CardComponent, AnimationComponent, NgxSpinnerModule],
  templateUrl: './card-details.component.html',
  styleUrl: './card-details.component.scss',
})
export class CardDetailsComponent implements AfterViewInit {
  private platformId = inject(PLATFORM_ID);
  readonly apiUrl = environment.API_URL;
  private readonly cardService = inject(CardsService);
  private readonly spinnerService = inject(NgxSpinnerService);
  private readonly animationService = inject(AnimationService);
  lwfInstance: any;
  attachedMovie: any;
  animationId = 0;
  entranceOstText = signal('Play OST');
  activeSkillOstText = signal('Play OST');
  standbySkillOstText = signal('Play OST');

  showAnimation = signal(false);
  filename = signal('');
  thumb = signal(0);
  @ViewChild('cardArtwork', { static: false })
  canvasRef!: ElementRef<HTMLCanvasElement> | null;
  @ViewChild('entranceOst', { static: false })
  entranceAudioRef!: ElementRef<HTMLAudioElement>;
  @ViewChild('activeSkillOst', { static: false })
  activeSkillOstRef!: ElementRef<HTMLAudioElement>;
  @ViewChild('standbySkillOst', { static: false })
  standbySkillOstRef!: ElementRef<HTMLAudioElement>;
  timeout: NodeJS.Timeout | null = null;
  private ngZone = inject(NgZone);
  id = input<string>('');
  card$ = toObservable(this.id).pipe(
    debounceTime(200),
    switchMap((id) => {
      return this.cardService.getCardById(+id).pipe(
        tap((x) => this.thumb.set(x.thumb)),
        map((card) => {
          console.log(card);

          return keysToCamel(card);
        })
      );
    })
  );

  // Version sans le service
  // loadLWF() {
  //   if (isPlatformBrowser(this.platformId)) {
  //     this.timeout = setTimeout(() => {
  //       if (this.canvasRef) {
  //         console.log('Chargement LWF ...');

  //         const canvas = this.canvasRef.nativeElement;
  //         if (!canvas) {
  //           console.error('Canvas non trouvé');
  //           return;
  //         }
  //         // Utiliser LWF pour initialiser l'animation
  //         LWF.useCanvasRenderer();
  //         LWF.ResourceCache.get().loadLWF({
  //           lwf: `card_${this.thumb().toString()}.lwf`,
  //           prefix: `${this.apiUrl}/artworks/${this.thumb().toString()}/`,
  //           stage: canvas,
  //           onload: (loadedLwfInstance: any) => {
  //             this.lwfInstance = loadedLwfInstance;
  //             this.canvasRef?.nativeElement.classList.add('artwork-anim');
  //             const attachedMovie = this.lwfInstance.rootMovie.attachMovie(
  //               'ef_001',
  //               'battle',
  //               0
  //             );
  //             if (attachedMovie) {
  //               attachedMovie.moveTo(
  //                 this.lwfInstance.width / 2,
  //                 this.lwfInstance.height / 2
  //               );
  //             }
  //             this.lwfInstance.width / 1.5, this.lwfInstance.height / 2;
  //             // this.attachedMovie = attachedMovie;

  //             this.animate();
  //             console.log('Fin du chargement LWF.');

  //             this.spinnerService.hide('card');
  //           },
  //           onerror: (error: any) => {
  //             console.error('Erreur lors du chargement de LWF :', error);
  //           },
  //         });
  //       } else {
  //         console.log('Non LR.');

  //         this.spinnerService.hide('card');
  //       }
  //     }, 1000);
  //   }
  // }

  loadLWF() {
    this.ngZone.runOutsideAngular(() => {
      if (isPlatformBrowser(this.platformId)) {
        if (this.canvasRef) {
          const canvas = this.canvasRef.nativeElement;
          LWF.useCanvasRenderer();
          this.animationService
            .loadLwf('card_${this.thumb().toString()}.lwf', {
              lwf: `card_${this.thumb().toString()}.lwf`,
              prefix: `${this.apiUrl}/artworks/${this.thumb().toString()}/`,
              stage: canvas,
            })
            .then((loadedLwfInstance: any) => {
              this.ngZone.run(() => {
                if (this.lwfInstance) {
                  this.animationService.reattachLWF(this.lwfInstance, canvas);
                } else {
                  this.lwfInstance = loadedLwfInstance;
                  const attachedMovie = this.lwfInstance.rootMovie.attachMovie(
                    'ef_001',
                    'battle',
                    0
                  );
                  this.canvasRef?.nativeElement.classList.add('artwork-anim');
                  if (attachedMovie) {
                    attachedMovie.moveTo(
                      this.lwfInstance.width / 2,
                      this.lwfInstance.height / 2
                    );
                  }
                  this.lwfInstance.width / 1.5, this.lwfInstance.height / 2;

                  this.animate();
                  this.spinnerService.hide('card');
                }
              });
            })
            .catch((error: any) => {
              console.error('Erreur lors du chargement de LWF :', error);
            });
        }
      }
    });
  }
  previousTick = 0;

  ngOnInit() {
    this.spinnerService.show('card');
  }
  ngAfterViewInit() {
    this.ngZone.runOutsideAngular(() => {
      this.timeout = setTimeout(() => {
        this.loadLWF();
      }, 500);
    });
  }

  getDelta() {
    const now = Date.now() / 1000;
    const delta = now - this.previousTick;
    this.previousTick = now;
    return delta;
  }

  animate = () => {
    if (this.lwfInstance) {
      this.lwfInstance.exec(this.getDelta());
      this.lwfInstance.render();
    }
    this.animationId = requestAnimationFrame(this.animate);
  };

  playOst(type: 'entrance' | 'activeSkill' | 'standbySkill') {
    const entranceAudio: HTMLAudioElement | null =
      this.entranceAudioRef?.nativeElement;
    const activeSkillAudio: HTMLAudioElement | null =
      this.activeSkillOstRef?.nativeElement;
    const standbySkillAudio: HTMLAudioElement | null =
      this.standbySkillOstRef?.nativeElement;
    if (type === 'entrance') {
      if (entranceAudio && this.entranceOstText() === 'Play OST') {
        entranceAudio.volume = 0.03;
        entranceAudio.loop = true;
        entranceAudio.play();
        if (activeSkillAudio?.played.length > 0) {
          activeSkillAudio.pause();
          this.activeSkillOstText.set('Play OST');
        }
        this.entranceOstText.set('Pause OST');
      } else {
        entranceAudio.volume = 0.03;
        entranceAudio.loop = true;
        entranceAudio.pause();
        this.entranceOstText.set('Play OST');
      }
    }

    if (type === 'activeSkill') {
      if (activeSkillAudio && this.activeSkillOstText() === 'Play OST') {
        activeSkillAudio.volume = 0.03;
        activeSkillAudio.loop = true;
        activeSkillAudio.play();
        if (entranceAudio?.played.length > 0) {
          entranceAudio.pause();
          this.entranceOstText.set('Play OST');
        }
        this.activeSkillOstText.set('Pause OST');
      } else {
        activeSkillAudio.volume = 0.03;
        activeSkillAudio.loop = true;
        activeSkillAudio.pause();
        this.activeSkillOstText.set('Play OST');
      }
    }

    if (type === 'standbySkill') {
      if (standbySkillAudio && this.standbySkillOstText() === 'Play OST') {
        standbySkillAudio.volume = 0.03;
        standbySkillAudio.loop = true;
        standbySkillAudio.play();

        this.standbySkillOstText.set('Pause OST');
      } else {
        standbySkillAudio.volume = 0.03;
        standbySkillAudio.loop = true;
        standbySkillAudio.pause();
        this.standbySkillOstText.set('Play OST');
      }
    }
  }

  showAnimationComponent(filename: string) {
    if (this.attachedMovie) this.attachedMovie.gotoAndStop();
    cancelAnimationFrame(this.animationId);
    this.showAnimation.set(true);
    this.filename.set(filename);
  }

  hideAnimationComponent() {
    this.showAnimation.set(false);

    requestAnimationFrame(this.animate);
  }

  ngOnDestroy() {
    if (this.lwfInstance) {
      this.lwfInstance.destroy();
      cancelAnimationFrame(this.animationId);
    }
    if (this.timeout) {
      clearTimeout(this.timeout);
    }
  }
}
