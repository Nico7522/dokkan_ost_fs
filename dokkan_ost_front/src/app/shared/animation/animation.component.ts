import {
  Component,
  ElementRef,
  EventEmitter,
  inject,
  input,
  Output,
  signal,
  viewChild,
} from '@angular/core';
import { NgxSpinnerService } from 'ngx-spinner';
import {
  attachScenesForCard9517161ActiveSkill,
  attachScenesForCard9523621ActiveSkill,
  attachScenesForCard9514221ActiveSkill,
  attachScenesForCard1016571ActiveSkill,
  forceReplay,
  attachScenesForCard9517911ActiveSkill,
  triggerNextScenes,
  updateScene,
} from '../../helpers/helpers';
import {
  sp_effect_a1_00143_scenes,
  sp_effect_a1_00144_scenes,
  sp_effect_a1_00364_scenes,
  sp_effect_a2_00114_scenes,
  sp_effect_a2_00174_scenes,
  sp_effect_a9_00094_scenes,
  triggerScenes,
} from '../../data/scenes';

@Component({
  selector: 'app-animation',
  templateUrl: './animation.component.html',
  styleUrl: './animation.component.scss',
})
export class AnimationComponent {
  private readonly spinnerService = inject(NgxSpinnerService);
  errorMessage = signal('');
  previousTick = 0;
  lwfInstance: any;
  attachedMovie: any;
  animationId = 0;
  lwfData = input.required<{ prefix: string; lwf: string }>();
  @Output() close = new EventEmitter<boolean>();
  body = document.querySelector('body') as HTMLBodyElement;
  readonly canvasRef =
    viewChild.required<ElementRef<HTMLCanvasElement>>('cardIntro');
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
    this.loadAnimation();
  }

  ngOnDestroy() {
    this.body.classList.remove('no-scroll');
    this.lwfInstance.destroy();
    cancelAnimationFrame(this.animationId);
  }

  loadAnimation() {
    this.spinnerService.show('loader');
    const canvasRef = this.canvasRef();
    if (canvasRef) {
      const canvas = canvasRef.nativeElement;
      if (!canvas) {
        console.error('Canvas non trouvé');
        return;
      }
      LWF.useCanvasRenderer();
      LWF.ResourceCache.get().loadLWF({
        lwf: this.lwfData().lwf,
        prefix: this.lwfData().prefix,
        setBackgroundColor: 'FF000000',
        additionalParams: {
          alpha: true,
          premultipliedAlpha: true,
        },
        stage: canvas,
        onload: (loadedLwfInstance: any) => {
          this.lwfInstance = loadedLwfInstance;
          if (!this.lwfInstance) {
            this.spinnerService.hide('loader');
            this.errorMessage.set('Animation unavailable');
          }
          this.canvasRef()?.nativeElement.classList.add('intro');
          if (this.lwfData().lwf === 'sp_effect_a2_00174.lwf') {
            let scenes = attachScenesForCard9523621ActiveSkill(
              this.lwfInstance
            );
            if (scenes) {
              scenes.moveTo(
                this.lwfInstance.width / 2,
                this.lwfInstance.height / 2
              );
            }
            this.i += 1;
            updateScene(
              this.lwfInstance,
              scenes,
              this.sp_effect_a2_00174_scenes,
              this.i
            );
          }

          if (this.lwfData().lwf === 'battle_301234.lwf') {
            this.attachedMovie = this.lwfInstance.rootMovie.attachMovie(
              this.sp_effect_a1_00364_scenes[this.i],
              'battle',
              1
            );

            updateScene(
              this.lwfInstance,
              this.attachedMovie,
              this.sp_effect_a1_00364_scenes,
              this.i
            );
            if (this.attachedMovie) {
              this.attachedMovie.moveTo(
                this.lwfInstance.width / 2,
                this.lwfInstance.height / 2
              );
            }
          }
          if (this.lwfData().lwf === 'sp_effect_b4_00315.lwf') {
            let attachedMovieBase = this.lwfInstance.rootMovie.attachMovie(
              'ef_001',
              'battle',
              1
            );
            let attachedMovie2 = this.lwfInstance.rootMovie.attachMovie(
              'ef_001b',
              'battle2',
              1
            );
            if (attachedMovie2) {
              attachedMovie2.moveTo(
                this.lwfInstance.width / 2,
                this.lwfInstance.height / 2
              );
            }
          }

          if (this.lwfData().lwf === 'sp_effect_a9_00094.lwf') {
            this.attachedMovie = this.lwfInstance.rootMovie.attachMovie(
              this.sp_effect_a9_00094_scenes[this.i],
              'battle',
              1
            );
            updateScene(
              this.lwfInstance,
              this.attachedMovie,
              this.sp_effect_a9_00094_scenes,
              this.i
            );

            if (this.attachedMovie) {
              this.attachedMovie.moveTo(
                this.lwfInstance.width / 2,
                this.lwfInstance.height / 2
              );
            }
          }

          if (this.lwfData().lwf === 'sp_effect_a1_00144.lwf') {
            this.attachedMovie = this.lwfInstance.rootMovie.attachMovie(
              this.sp_effect_a1_00144_scenes[this.i],
              'a',
              1
            );
            updateScene(
              this.lwfInstance,
              this.attachedMovie,
              this.sp_effect_a1_00144_scenes,
              this.i
            );
            if (this.attachedMovie) {
              this.attachedMovie.moveTo(
                this.lwfInstance.width / 2,
                this.lwfInstance.height / 2
              );
            }
          }

          if (this.lwfData().lwf === 'sp_effect_a2_00114.lwf') {
            this.attachedMovie = this.lwfInstance.rootMovie.attachMovie(
              'ef_001',
              'battle',
              1
            );
            if (this.attachedMovie) {
              this.attachedMovie.moveTo(
                this.lwfInstance.width / 2,
                this.lwfInstance.height / 2
              );
            }

            attachScenesForCard9517161ActiveSkill(
              this.lwfInstance,
              this.attachedMovie
            );
          }

          if (this.lwfData().lwf === 'sp_effect_a2_00100.lwf') {
            this.attachedMovie = this.lwfInstance.rootMovie.attachMovie(
              'ef_007',
              'battle',
              1
            );
            if (this.attachedMovie) {
              this.attachedMovie.moveTo(
                this.lwfInstance.width / 2,
                this.lwfInstance.height / 2
              );
            }
          }

          if (this.lwfData().lwf === 'sp_effect_a1_00143.lwf') {
            this.attachedMovie = this.lwfInstance.rootMovie.attachMovie(
              'ef_001',
              'battle',
              1
            );
            attachScenesForCard9514221ActiveSkill(
              this.lwfInstance,
              this.attachedMovie
            );

            if (this.attachedMovie) {
              this.attachedMovie.moveTo(
                this.lwfInstance.width / 2,
                this.lwfInstance.height / 2
              );
            }
          }

          if (this.lwfData().lwf === 'sp_effect_b4_00086.lwf') {
            console.log(this.lwfInstance);
            this.attachedMovie = this.lwfInstance.rootMovie.attachMovie(
              'ef_001',
              'battle',
              1
            );

            attachScenesForCard1016571ActiveSkill(
              this.lwfInstance,
              this.attachedMovie
            );
            if (this.attachedMovie) {
              this.attachedMovie.moveTo(
                this.lwfInstance.width / 2,
                this.lwfInstance.height / 2
              );
            }
          }

          if (this.lwfData().lwf === 'battle_301206.lwf') {
            this.attachedMovie = this.lwfInstance.rootMovie.attachMovie(
              'ef_001',
              'battle',
              1
            );
            forceReplay(this.lwfInstance, this.attachedMovie, 'ef_001');
            if (this.attachedMovie) {
              this.attachedMovie.moveTo(
                this.lwfInstance.width / 2,
                this.lwfInstance.height / 2
              );
            }
          }
          if (this.lwfData().lwf === 'sp_effect_a1_00175.lwf') {
            this.attachedMovie = this.lwfInstance.rootMovie.attachMovie(
              'ef_001',
              'battle',
              1
            );
            attachScenesForCard9517911ActiveSkill(
              this.lwfInstance,
              this.attachedMovie
            );
            if (this.attachedMovie) {
              this.attachedMovie.moveTo(
                this.lwfInstance.width / 2,
                this.lwfInstance.height / 2
              );
            }
          }

          if (this.lwfData().lwf === 'sp_effect_b4_00189.lwf') {
            let attachedMovie2 = this.lwfInstance.rootMovie.attachMovie(
              'ef_002',
              'battle2',
              1
            );

            if (attachedMovie2) {
              attachedMovie2.moveTo(
                this.lwfInstance.width / 2,
                this.lwfInstance.height / 2
              );
            }
          }
          // Si aucune animation
          if (!this.attachedMovie) {
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
        },
        onerror: (error: any) => {
          console.error('Erreur lors du chargement de LWF :', error);
        },
      });
    }
  }
}
