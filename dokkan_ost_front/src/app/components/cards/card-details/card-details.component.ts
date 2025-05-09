import {
  AfterViewInit,
  Component,
  computed,
  ElementRef,
  inject,
  input,
  NgZone,
  PLATFORM_ID,
  signal,
  viewChild,
} from '@angular/core';
import { CardsService } from '@services/cards/cards.service';
import { toObservable } from '@angular/core/rxjs-interop';
import { catchError, EMPTY, map, switchMap, tap } from 'rxjs';
import { AsyncPipe, isPlatformBrowser } from '@angular/common';
import { CardComponent } from '@shared/card/card.component';
import { keysToCamel } from '../../../helpers/helpers';
import { NgxSpinnerModule, NgxSpinnerService } from 'ngx-spinner';
import { AnimationComponent } from '@shared/animation/animation.component';
import { environment } from '../../../../environments/environment';
import { AnimationService } from '@services/animation/animation.service';
import { Lwf } from 'app/models/lwf.type';
import { LwfMovie } from 'app/models/lwf-movie.type';
import { PlayButtonComponent } from '@shared/play-button/play-button.component';
import { ErrorComponent } from '@shared/error/error.component';
@Component({
  selector: 'app-card-details',
  standalone: true,
  imports: [
    AsyncPipe,
    CardComponent,
    AnimationComponent,
    NgxSpinnerModule,
    PlayButtonComponent,
    ErrorComponent,
  ],
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
  bgmId = signal(0);
  error = signal('');
  showAnimation = signal(false);
  filename = signal('');
  triggerScene = signal('');
  thumb = signal(0);
  previousTick = 0;
  animationData = computed(() => {
    return {
      prefix: this.apiUrl + '/animations/' + this.filename() + '/fr/',
      lwf: this.filename() + '.lwf',
      bgmId: this.bgmId(),
      triggerScene: this.triggerScene(),
    };
  });
  readonly canvasRef = viewChild<ElementRef<HTMLCanvasElement> | null>(
    'cardArtwork'
  );
  timeout: NodeJS.Timeout | null = null;
  private ngZone = inject(NgZone);
  id = input<string>('');
  card$ = toObservable(this.id).pipe(
    switchMap((id) => {
      return this.cardService.getCardById(+id).pipe(
        tap((x) => this.thumb.set(x.thumb)),
        map((card) => {
          return keysToCamel(card);
        }),
        catchError(() => {
          this.error.set("Card can't be fetch");
          return EMPTY;
        })
      );
    })
  );

  loadLWF() {
    this.ngZone.runOutsideAngular(() => {
      if (isPlatformBrowser(this.platformId)) {
        const canvasRef = this.canvasRef();
        if (canvasRef) {
          const canvas = canvasRef.nativeElement;
          LWF.useCanvasRenderer();
          this.animationService
            .loadLwf({
              lwf: `card_${this.thumb().toString()}.lwf`,
              prefix: `${this.apiUrl}/artworks/${this.thumb().toString()}/`,
              stage: canvas,
            })
            .then((loadedLwfInstance: Lwf) => {
              this.ngZone.run(() => {
                this.lwfInstance = loadedLwfInstance;
                this.attachedMovie = this.lwfInstance.rootMovie.attachMovie(
                  'ef_001',
                  'battle',
                  1
                );
                this.canvasRef()?.nativeElement.classList.add('artwork-anim');

                this.attachedMovie.moveTo(
                  this.lwfInstance.width / 2,
                  this.lwfInstance.height / 2
                );
                this.lwfInstance.width / 1.5, this.lwfInstance.height / 2;
                this.animate();

                this.spinnerService.hide('artwork');
              });
            })
            .catch((error: any) => {
              console.error('Erreur lors du chargement de LWF :', error);
            });
        }
      }
    });
  }

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

  onShowAnimationComponent(
    data: { filename: string; bgmId: number },
    finishSkillIndex?: number
  ) {
    if (this.attachedMovie) this.attachedMovie.gotoAndStop();
    cancelAnimationFrame(this.animationId);
    this.showAnimation.set(true);
    this.filename.set(data.filename);
    this.bgmId.set(data.bgmId);
    this.triggerScene.set('');
    if (data.filename === 'battle_301261' && finishSkillIndex === 1) {
      this.triggerScene.set('ef_002');
    }
  }

  hideAnimationComponent() {
    this.showAnimation.set(false);
    if (this.attachedMovie && this.lwfInstance) {
      this.attachedMovie.gotoAndPlay();
      this.attachedMovie = this.lwfInstance.rootMovie.attachMovie(
        'ef_001',
        'battle',
        1
      );
      this.attachedMovie.moveTo(
        this.lwfInstance.width / 2,
        this.lwfInstance.height / 2
      );
      this.lwfInstance.width / 1.5, this.lwfInstance.height / 2;
    }
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

  private getDelta() {
    const now = Date.now() / 1000;
    const delta = now - this.previousTick;
    this.previousTick = now;
    return delta;
  }

  private animate = () => {
    if (this.lwfInstance) {
      this.lwfInstance.exec(this.getDelta());
      this.lwfInstance.render();
    }
    this.animationId = requestAnimationFrame(this.animate);
  };
}
