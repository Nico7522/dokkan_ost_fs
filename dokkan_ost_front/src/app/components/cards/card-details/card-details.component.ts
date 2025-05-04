import {
  AfterViewInit,
  Component,
  ElementRef,
  inject,
  input,
  NgZone,
  PLATFORM_ID,
  QueryList,
  signal,
  ViewChild,
  ViewChildren,
  viewChild,
} from '@angular/core';
import { CardsService } from '@services/cards/cards.service';
import { toObservable } from '@angular/core/rxjs-interop';
import { map, switchMap, tap } from 'rxjs';
import { AsyncPipe, isPlatformBrowser } from '@angular/common';
import { CardComponent } from '@shared/card/card.component';
import { keysToCamel, playLWF } from '../../../helpers/helpers';
import { NgxSpinnerModule, NgxSpinnerService } from 'ngx-spinner';
import { AnimationComponent } from '@shared/animation/animation.component';
import { environment } from '../../../../environments/environment';
import { AnimationService } from '@services/animation/animation.service';
import { randomUUID } from 'crypto';
import { Lwf } from 'app/models/lwf.type';
import { LwfMovie } from 'app/models/lwf-movie.type';
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
  lwfInstance: Lwf | null = null;
  attachedMovie: LwfMovie | null = null;
  animationId = 0;
  entranceOstText = signal('Play OST');
  activeSkillOstText = signal('Play OST');
  standbySkillOstText = signal('Play OST');
  ostUnplayed = signal(true);
  readonly showAnimation = signal(false);
  filename = signal('');
  triggerScene = signal('');
  thumb = signal(0);
  readonly canvasRef = viewChild<ElementRef<HTMLCanvasElement> | null>(
    'cardArtwork'
  );
  @ViewChild('entranceOst', { static: false })
  entranceAudioRef: ElementRef<HTMLAudioElement> | null = null;
  @ViewChild('activeSkillOst', { static: false })
  activeSkillOstRef: ElementRef<HTMLAudioElement> | null = null;
  @ViewChild('standbySkillOst', { static: false })
  standbySkillOstRef: ElementRef<HTMLAudioElement> | null = null;
  @ViewChildren('finishSkillOst')
  finishSkillOstRef: QueryList<ElementRef<HTMLAudioElement>> | null = null;
  timeout: NodeJS.Timeout | null = null;
  private ngZone = inject(NgZone);
  id = input<string>('');
  card$ = toObservable(this.id).pipe(
    switchMap((id) => {
      return this.cardService.getCardById(+id).pipe(
        tap((x) => this.thumb.set(x.thumb)),
        map((card) => {
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
        const canvasRef = this.canvasRef();
        if (canvasRef) {
          const canvas = canvasRef.nativeElement;
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
                  this.canvasRef()?.nativeElement.classList.add('artwork-anim');
                  this.attachMovie(this.lwfInstance, this.attachedMovie);
                  this.animate();
                  this.spinnerService.hide('artwork');
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
    this.spinnerService.show('artwork');
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

  playOst(type: 'entrance' | 'activeSkill' | 'standbySkill' | 'finishSkill') {
    // const entranceAudio: HTMLAudioElement | null =
    //   this.entranceAudioRef.nativeElement;
    // const activeSkillAudio: HTMLAudioElement | null =
    //   this.activeSkillOstRef.nativeElement;
    // const standbySkillAudio: HTMLAudioElement | null =
    //   this.standbySkillOstRef.nativeElement;

    if (type === 'entrance') {
      const entranceAudio: HTMLAudioElement = (
        this.entranceAudioRef as ElementRef<HTMLAudioElement>
      ).nativeElement;
      if (entranceAudio && this.entranceOstText() === 'Play OST') {
        entranceAudio.volume = 0.03;
        entranceAudio.loop = true;
        entranceAudio.play();
        if (
          this.activeSkillOstRef &&
          this.activeSkillOstRef.nativeElement.played.length > 0
        ) {
          this.activeSkillOstRef.nativeElement.pause();
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
      const activeSkillAudio: HTMLAudioElement | null = (
        this.activeSkillOstRef as ElementRef<HTMLAudioElement>
      ).nativeElement;
      if (activeSkillAudio && this.activeSkillOstText() === 'Play OST') {
        activeSkillAudio.volume = 0.03;
        activeSkillAudio.loop = true;
        activeSkillAudio.play();
        if (
          this.entranceAudioRef &&
          this.entranceAudioRef.nativeElement.played.length > 0
        ) {
          this.entranceAudioRef.nativeElement.pause();
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
      const standbySkillAudio: HTMLAudioElement | null = (
        this.standbySkillOstRef as ElementRef<HTMLAudioElement>
      ).nativeElement;
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

  playFinishSkillOst(index: number, play: boolean) {
    const audioElement = (
      this.finishSkillOstRef as QueryList<ElementRef<HTMLAudioElement>>
    ).toArray()[index];
    if (this.finishSkillOstRef && audioElement) {
      // Met les autres OST en pause
      this.finishSkillOstRef.toArray().forEach((el) => {
        if (el.nativeElement.played.length > 0) {
          el.nativeElement.pause();
        }
      });
      if (play) {
        audioElement.nativeElement.volume = 0.03;
        audioElement.nativeElement.loop = true;
        audioElement.nativeElement.play();
        this.ostUnplayed.set(false);
      } else {
        audioElement.nativeElement.pause();
      }
    }
  }

  showAnimationComponent(filename: string, finishSkillIndex?: number) {
    if (this.attachedMovie) this.attachedMovie.gotoAndStop();
    cancelAnimationFrame(this.animationId);
    this.showAnimation.set(true);
    this.filename.set(filename);
    this.triggerScene.set('');
    if (filename === 'battle_301261' && finishSkillIndex === 1) {
      this.triggerScene.set('ef_002');
    }
  }

  hideAnimationComponent() {
    this.showAnimation.set(false);
    if (this.attachedMovie) this.attachedMovie.gotoAndPlay();
    this.attachMovie(this.lwfInstance, this.attachedMovie);
    this.animationId = requestAnimationFrame(this.animate);
  }

  ngOnDestroy() {
    if (this.lwfInstance) {
      this.lwfInstance.destroy();
      this.lwfInstance = null;
      cancelAnimationFrame(this.animationId);
    }

    if (this.attachedMovie) {
      this.attachedMovie.removeMovieClip();
      this.attachedMovie = null;
    }
    if (this.timeout) {
      clearTimeout(this.timeout);
    }
  }

  private attachMovie(lwfInstance: any, attachedMovie: any) {
    attachedMovie = lwfInstance.rootMovie.attachMovie('ef_001', 'battle', 0);
    if (attachedMovie) {
      attachedMovie.moveTo(lwfInstance.width / 2, lwfInstance.height / 2);
    }
    lwfInstance.width / 1.5, lwfInstance.height / 2;
  }
}
