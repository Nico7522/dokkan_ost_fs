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
  lwfData = input.required<{ prefix: string; lwf: string }>();
  @Output() close = new EventEmitter<boolean>();
  body = document.querySelector('body') as HTMLBodyElement;
  @ViewChild('cardIntro', { static: false })
  canvasRef!: ElementRef<HTMLCanvasElement>;

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
    requestAnimationFrame(this.animate);
  };

  // From dokkan.dev
  // startAnimation(lwf: any) {
  //   let lastTime = performance.now();

  //   function render(currentTime: number) {
  //     if (lwf && lwf.active) {
  //       const deltaTime = (currentTime - lastTime) / 1000;
  //       lastTime = currentTime;
  //       lwf.exec(deltaTime);
  //       lwf.render();
  //     }
  //     requestAnimationFrame(render);
  //   }

  //   requestAnimationFrame(render);
  // }

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
          this.canvasRef?.nativeElement.classList.add('intro');
          const attachedMovieBase = this.lwfInstance.rootMovie.attachMovie(
            'ef_001',
            'a',
            1
          );
          console.log(attachedMovieBase);
          attachedMovieBase.addEventHandler('update', () => {
            console.log(attachedMovieBase.currentFrame);
            if (
              attachedMovieBase.currentFrame >=
              attachedMovieBase.totalFrames - 1
            ) {
              console.log('stop');

              attachedMovieBase.gotoAndStop();
            }
          });
          if (attachedMovieBase) {
            attachedMovieBase.moveTo(
              this.lwfInstance.width / 2,
              this.lwfInstance.height / 2
            );
          }

          const attachedMovieA = this.lwfInstance.rootMovie.attachMovie(
            'ef_002',
            'b',
            2
          );

          if (attachedMovieA) {
            attachedMovieA.moveTo(
              this.lwfInstance.width / 2,
              this.lwfInstance.height / 2
            );
          }
          const attachedMovie2 = this.lwfInstance.rootMovie.attachMovie(
            'ef_001b',
            'b',
            1
          );
          if (attachedMovie2) {
            attachedMovie2.moveTo(
              this.lwfInstance.width / 2,
              this.lwfInstance.height / 2
            );
          }
          const attachedMovie = this.lwfInstance.rootMovie.attachMovie(
            'ef_001_u',
            'c',
            1
          );

          if (attachedMovie) {
            attachedMovie.moveTo(
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
}
