import {
  Component,
  ElementRef,
  EventEmitter,
  inject,
  input,
  NgZone,
  Output,
  PLATFORM_ID,
  signal,
  viewChild,
} from '@angular/core';
import { NgxSpinnerService } from 'ngx-spinner';

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

@Component({
  selector: 'app-animation',
  templateUrl: './animation.component.html',
  styleUrl: './animation.component.scss',
})
export class AnimationComponent {
  private readonly spinnerService = inject(NgxSpinnerService);
  private readonly animationService = inject(AnimationService);
  errorMessage = signal('');
  previousTick = 0;
  lwfInstance: any;
  attachedMovie: any;
  animationId = 0;
  private platformId = inject(PLATFORM_ID);
  lwfData = input.required<{
    prefix: string;
    lwf: string;
    triggerScene?: string;
  }>();
  @Output() close = new EventEmitter<boolean>();
  body = document.querySelector('body') as HTMLBodyElement;
  readonly canvasRef =
    viewChild.required<ElementRef<HTMLCanvasElement>>('cardIntro');
  private ngZone = inject(NgZone);
  triggerScenes = triggerScenes;
  sp_effect_a2_00174_scenes = sp_effect_a2_00174_scenes;
  sp_effect_a1_00364_scenes = sp_effect_a1_00364_scenes;
  sp_effect_a1_00144_scenes = sp_effect_a1_00144_scenes;
  sp_effect_a9_00094_scenes = sp_effect_a9_00094_scenes;
  sp_effect_a2_00114_scenes = sp_effect_a2_00114_scenes;
  sp_effect_a1_00143_scenes = sp_effect_a1_00143_scenes;
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

  // From dokkan.dev
  startAnimation(lwf: any) {
    let lastTime = performance.now();

    function render(currentTime: number) {
      if (lwf && lwf.active) {
        const deltaTime = (currentTime - lastTime) / 1000;
        lastTime = currentTime;
        lwf.exec(deltaTime);
        lwf.render();
      }
      requestAnimationFrame(render);
    }

    requestAnimationFrame(render);
  }

  playAnimation() {
    // Exemple de lecture audio
    // const audio = this.audioRef.nativeElement;
    // if (audio) {
    //   audio.volume = 0.03;
    //   audio.loop = true;
    //   audio.play();
    // }
    // this.loadAnimation();
    // animate();
  }

  ngAfterViewInit() {
    this.body.classList.add('no-scroll');
    this.ngZone.runOutsideAngular(() => {
      this.loadLWF();
    });
  }

  ngOnDestroy() {
    this.body.classList.remove('no-scroll');
    this.lwfInstance.destroy();
    cancelAnimationFrame(this.animationId);
  }
  loadLWF() {
    this.ngZone.runOutsideAngular(() => {
      if (isPlatformBrowser(this.platformId)) {
        if (this.canvasRef) {
          const canvas = this.canvasRef().nativeElement;
          LWF.useCanvasRenderer();

          this.animationService
            .loadLwf(this.lwfData().lwf, {
              lwf: this.lwfData().lwf,
              prefix: this.lwfData().prefix,
              stage: canvas,
            })
            .then((loadedLwfInstance: any) => {
              this.ngZone.run(() => {
                this.lwfInstance = loadedLwfInstance;
                if (!this.lwfInstance) {
                  this.spinnerService.hide('loader');
                  this.errorMessage.set('Animation unavailable');
                }
                this.canvasRef()?.nativeElement.classList.add('intro');
                let isPlayed = isSpecialAnimationPlayed(
                  this.lwfInstance,
                  this.i,
                  this.lwfData().lwf,
                  this.lwfData().triggerScene
                );

                // Si aucune animation
                if (!isPlayed) {
                  this.attachedMovie = this.lwfInstance.rootMovie.attachMovie(
                    'ef_001',
                    'battle',
                    1
                  );

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

                // this.lwfInstance.scaleForHeight(canvas.width, canvas.height);
                this.spinnerService.hide('loader');
                this.animate();
              });
            })
            .catch((error: any) => {
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
