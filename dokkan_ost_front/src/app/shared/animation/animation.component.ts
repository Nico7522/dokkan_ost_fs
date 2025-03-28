import {
  Component,
  ElementRef,
  EventEmitter,
  inject,
  input,
  Output,
  signal,
  ViewChild,
} from '@angular/core';
import { NgxSpinnerService } from 'ngx-spinner';
import { startGokuKaiokenActiveSkill } from '../../helpers/helpers';

@Component({
  selector: 'app-animation',
  standalone: true,
  imports: [],
  templateUrl: './animation.component.html',
  styleUrl: './animation.component.scss',
})
export class AnimationComponent {
  private readonly spinnerService = inject(NgxSpinnerService);
  previousTick = 0;
  lwfInstance: any;
  animationId = 0;
  lwfData = input.required<{ prefix: string; lwf: string }>();
  @Output() close = new EventEmitter<boolean>();
  body = document.querySelector('body') as HTMLBodyElement;
  @ViewChild('cardIntro', { static: false })
  canvasRef!: ElementRef<HTMLCanvasElement>;
  triggerScenes = ['ef_001', 'ef_001_u'];
  sp_effect_a2_00174_scenes = [
    'ef_001_front',
    'ef_001_back',
    'ef_002',
    'ef_003_back',
    'ef_003_front',
  ];
  sp_effect_a1_00364_scenes = ['ef_001', 'ef_002', 'ef_003'];

  sp_effect_a9_00094_scenes = [
    'ef_001',
    'ef_002',
    'ef_003',
    'ef_004',
    'ef_005',
    'ef_006',
    'ef_007',
    'ef_008',
    'ef_009',
    'ef_010',
  ];
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
    if (this.canvasRef) {
      const canvas = this.canvasRef.nativeElement;
      if (!canvas) {
        console.error('Canvas non trouvé');
        return;
      }
      LWF.useCanvasRenderer();
      LWF.ResourceCache.get().loadLWF({
        lwf: this.lwfData().lwf,
        prefix: this.lwfData().prefix,
        stage: canvas,
        onload: (loadedLwfInstance: any) => {
          this.lwfInstance = loadedLwfInstance;
          console.log(loadedLwfInstance);

          this.canvasRef?.nativeElement.classList.add('intro');
          if (this.lwfData().lwf === 'sp_effect_a2_00174.lwf') {
            let scenes = startGokuKaiokenActiveSkill(this.lwfInstance);
            if (scenes) {
              scenes.moveTo(
                this.lwfInstance.width / 2,
                this.lwfInstance.height / 2
              );
            }
            this.i += 1;
            this.updateScene(scenes, this.sp_effect_a2_00174_scenes);
          }

          if (this.lwfData().lwf === 'battle_301234.lwf') {
            let attachedMovie = this.lwfInstance.rootMovie.attachMovie(
              this.sp_effect_a1_00364_scenes[this.i],
              'a',
              1
            );
            this.updateScene(attachedMovie, this.sp_effect_a1_00364_scenes);
            if (attachedMovie) {
              attachedMovie.moveTo(
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
            let attachedMovie = this.lwfInstance.rootMovie.attachMovie(
              this.sp_effect_a9_00094_scenes[this.i],
              'a',
              1
            );
            this.updateScene(attachedMovie, this.sp_effect_a9_00094_scenes);
            if (attachedMovie) {
              attachedMovie.moveTo(
                this.lwfInstance.width / 2,
                this.lwfInstance.height / 2
              );
            }
          }
          let attachedMovieBase = this.lwfInstance.rootMovie.attachMovie(
            'ef_001',
            'battle',
            1
          );
          let i = 1;
          while (!attachedMovieBase && i < this.triggerScenes.length) {
            attachedMovieBase = this.lwfInstance.rootMovie.attachMovie(
              this.triggerScenes[i],
              'battle',
              1
            );
            i++;
          }

          if (attachedMovieBase) {
            attachedMovieBase.moveTo(
              this.lwfInstance.width / 2,
              this.lwfInstance.height / 2
            );
          }

          this.spinnerService.hide('loader');
          this.animate();
        },
        onerror: (error: any) => {
          console.error('Erreur lors du chargement de LWF :', error);
        },
      });
    }
  }

  updateScene(attachedMovie: any, scenes: string[]) {
    this.i += 1;
    if (attachedMovie) {
      attachedMovie.moveTo(
        this.lwfInstance.width / 2,
        this.lwfInstance.height / 2
      );
    }
    if (this.i === scenes.length) this.i = 0;
    attachedMovie.addEventHandler('update', () => {
      if (attachedMovie.currentFrame >= attachedMovie.totalFrames - 1) {
        attachedMovie = this.lwfInstance.rootMovie.attachMovie(
          scenes[this.i],
          'a',
          1
        );

        this.updateScene(attachedMovie, scenes);
      }
    });
  }
}
