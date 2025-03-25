import {
  Component,
  ElementRef,
  EventEmitter,
  input,
  Output,
  signal,
  ViewChild,
} from '@angular/core';

@Component({
  selector: 'app-animation',
  standalone: true,
  imports: [],
  templateUrl: './animation.component.html',
  styleUrl: './animation.component.scss',
})
export class AnimationComponent {
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

  // getDelta() {
  //   let lastTime = performance.now();
  //   const now = Date.now() / 1000;
  //   const delta = (now - lastTime) / 1000;
  //   lastTime = now;
  //   return delta;
  // }

  // animate = () => {
  //   if (this.lwfInstance) {
  //     this.lwfInstance.exec(this.getDelta());
  //     this.lwfInstance.render();
  //   }
  //   requestAnimationFrame(this.animate);
  // };
  startAnimation(lwf: any) {
    let lastTime = performance.now(); // Capture the starting time

    // Define the render function that updates and renders the animation on each frame.
    function render(currentTime: number) {
      if (lwf && lwf.active) {
        // Calculate the elapsed time (delta) in seconds since the last frame
        const deltaTime = (currentTime - lastTime) / 1000;
        lastTime = currentTime;
        // Update the animation state based on the time elapsed
        lwf.exec(deltaTime);
        // Render the current frame of the animation onto the canvas
        lwf.render();
      }
      // Request the next animation frame. This recursive call keeps the loop running.
      requestAnimationFrame(render);
    }

    // Start the animation loop by requesting the first frame.
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
  }

  loadAnimation() {
    console.log(this.lwfData());

    setTimeout(() => {
      if (this.canvasRef) {
        const canvas = this.canvasRef.nativeElement;
        // Vérifiez si le canvas existe
        if (!canvas) {
          console.error('Canvas non trouvé');
          return;
        }
        // Utiliser LWF pour initialiser l'animation
        LWF.useCanvasRenderer();
        LWF.ResourceCache.get().loadLWF({
          lwf: this.lwfData().lwf,
          prefix: this.lwfData().prefix,
          stage: canvas,
          onload: (loadedLwfInstance: any) => {
            this.lwfInstance = loadedLwfInstance;
            console.log(loadedLwfInstance);

            this.canvasRef?.nativeElement.classList.add('intro');
            const attachedMovieBase = this.lwfInstance.rootMovie.attachMovie(
              'ef_001',
              'a',
              1
            );

            if (attachedMovieBase) {
              attachedMovieBase.moveTo(
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

            this.startAnimation(loadedLwfInstance);
          },
          onerror: (error: any) => {
            console.error('Erreur lors du chargement de LWF :', error);
          },
        });
      }
    }, 500);
  }
}
