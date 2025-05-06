import {
  AfterViewInit,
  Component,
  ElementRef,
  EventEmitter,
  inject,
  input,
  NgZone,
  OnInit,
  output,
  Output,
  PLATFORM_ID,
  signal,
  ViewChild,
  viewChild,
} from '@angular/core';
import { NgxSpinnerModule, NgxSpinnerService } from 'ngx-spinner';

import {
  sp_effect_a1_00143_scenes,
  sp_effect_a1_00144_scenes,
  sp_effect_a1_00364_scenes,
  sp_effect_a2_00114_scenes,
  sp_effect_a2_00174_scenes,
  sp_effect_a9_00094_scenes,
  triggerScenes,
} from '../../data/scenes';
import { isSpecialAnimationPlayed } from '../../helpers/helpers';
import { isPlatformBrowser } from '@angular/common';
import { AnimationService } from '@services/animation/animation.service';
import { Lwf } from 'app/models/lwf.type';
import { LwfMovie } from 'app/models/lwf-movie.type';
import { environment } from 'environments/environment';

@Component({
  selector: 'app-animation',
  imports: [NgxSpinnerModule],
  templateUrl: './animation.component.html',
  styleUrl: './animation.component.scss',
})
export class AnimationComponent implements OnInit, AfterViewInit {
  ngOnInit(): void {
    this.spinnerService.show('animation');
  }
  private readonly spinnerService = inject(NgxSpinnerService);
  private readonly animationService = inject(AnimationService);
  errorMessage = signal('');
  previousTick = 0;
  lwfInstance: Lwf | null = null;
  attachedMovie: LwfMovie | null = null;
  animationId = 0;
  apiUrl = environment.API_URL;
  private platformId = inject(PLATFORM_ID);
  animationData = input.required<{
    prefix: string;
    lwf: string;
    bgmId: number;
    triggerScene?: string;
  }>();
  // lwfData = input.required<{
  //   prefix: string;
  //   lwf: string;
  //   triggerScene?: string;
  // }>();
  @ViewChild('ostRef', { static: false })
  ostRef: ElementRef<HTMLAudioElement> | null = null;
  close = output<boolean>();
  body = document.querySelector('body') as HTMLBodyElement;
  readonly canvasRef =
    viewChild.required<ElementRef<HTMLCanvasElement>>('cardIntro');
  private ngZone = inject(NgZone);
  triggerScenes = triggerScenes;
  i = 0;
  closeComponent() {
    this.close.emit(true);
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

  ngAfterViewInit() {
    this.body.classList.add('no-scroll');
    this.ngZone.runOutsideAngular(() => {
      const ref = this.ostRef?.nativeElement;
      console.log(ref);

      if (ref) {
        ref.volume = 0.03;
        ref.loop = true;
        ref.play();
      }
      this.loadLWF();
    });
  }

  ngOnDestroy() {
    this.body.classList.remove('no-scroll');
    if (this.lwfInstance) {
      this.lwfInstance.destroy();
      this.lwfInstance = null;
    }

    if (this.attachedMovie) {
      this.attachedMovie.removeMovieClip();
      this.attachedMovie = null;
    }
    cancelAnimationFrame(this.animationId);
  }
  loadLWF() {
    this.ngZone.runOutsideAngular(() => {
      if (isPlatformBrowser(this.platformId)) {
        if (this.canvasRef) {
          const canvas = this.canvasRef().nativeElement;
          LWF.useCanvasRenderer();

          this.animationService
            .loadLwf({
              lwf: this.animationData().lwf,
              prefix: this.animationData().prefix,
              stage: canvas,
            })
            .then((loadedLwfInstance: Lwf) => {
              this.ngZone.run(() => {
                this.lwfInstance = loadedLwfInstance;
                if (!this.lwfInstance) {
                  this.errorMessage.set('Animation unavailable');
                }
                this.canvasRef()?.nativeElement.classList.add('intro');

                // Fonction avec un switch case contenant toutes les animations pour lesquelles déclencher une scène ne suffit pas.
                // Si l'animation n'est pas trouvé dans le switch case renvoie false, sinon true.
                let isPlayed = isSpecialAnimationPlayed(
                  this.lwfInstance,
                  this.i,
                  this.animationData().lwf,
                  this.animationData().triggerScene
                );

                // Essaie de déclencher l'animation avec la scène de base 'ef_001'.
                if (!isPlayed) {
                  this.attachedMovie = this.lwfInstance.rootMovie.attachMovie(
                    'ef_001',
                    'battle',
                    1
                  );

                  // Si la scène de base ne fonctionne pas, et du moment qu'attachedMovie est null, on boucle sur triggerScenes jusqu'au moment où la bonne scène est trouvée.
                  let i = 1;
                  while (!this.attachedMovie && i < this.triggerScenes.length) {
                    this.attachedMovie = this.lwfInstance.rootMovie.attachMovie(
                      this.triggerScenes[i],
                      'battle',
                      1
                    );
                    i++;
                  }
                  if (this.attachedMovie) {
                    this.attachedMovie.moveTo(
                      this.lwfInstance.width / 2,
                      this.lwfInstance.height / 2
                    );
                  }
                }
                this.spinnerService.hide('animation');
                this.animate();
              });
            })
            .catch((error: any) => {
              this.spinnerService.hide('animation');

              console.error('Erreur lors du chargement de LWF :', error);
            });
        }
      }
    });
  }

  // Version sans le service
  // loadAnimation() {
  //   this.spinnerService.show('loader');
  //   const canvasRef = this.canvasRef();
  //   if (canvasRef) {
  //     const canvas = canvasRef.nativeElement;
  //     if (!canvas) {
  //       console.error('Canvas non trouvé');
  //       return;
  //     }
  //     LWF.useCanvasRenderer();
  //     LWF.ResourceCache.get().loadLWF({
  //       lwf: this.lwfData().lwf,
  //       prefix: this.lwfData().prefix,

  //       setBackgroundColor: 'FF000000',
  //       additionalParams: {
  //         alpha: true,
  //         premultipliedAlpha: true,
  //       },
  //       stage: canvas,
  //       onload: (loadedLwfInstance: any) => {
  //         this.lwfInstance = loadedLwfInstance;
  //         if (!this.lwfInstance) {
  //           this.spinnerService.hide('loader');
  //           this.errorMessage.set('Animation unavailable');
  //         }
  //         this.canvasRef()?.nativeElement.classList.add('intro');
  //         let isPlayed = isSpecialAnimationPlayed(
  //           this.lwfInstance,
  //           this.i,
  //           this.lwfData().lwf
  //         );

  //         // Si aucune animation
  //         if (!isPlayed) {
  //           this.attachedMovie = this.lwfInstance.rootMovie.attachMovie(
  //             'ef_001',
  //             'battle',
  //             1
  //           );

  //           let i = 1;
  //           while (!this.attachedMovie && i < this.triggerScenes.length) {
  //             this.attachedMovie = this.lwfInstance.rootMovie.attachMovie(
  //               this.triggerScenes[i],
  //               'battle',
  //               1
  //             );
  //             i++;
  //           }

  //           if (this.attachedMovie) {
  //             this.attachedMovie.moveTo(
  //               this.lwfInstance.width / 2,
  //               this.lwfInstance.height / 2
  //             );
  //           }
  //         }

  //         // this.lwfInstance.scaleForHeight(canvas.width, canvas.height);
  //         this.spinnerService.hide('loader');
  //         this.animate();
  //       },
  //       onerror: (error: any) => {
  //         console.error('Erreur lors du chargement de LWF :', error);
  //       },
  //     });
  //   }
  // }
}
