import {
  Component,
  ElementRef,
  signal,
  inject,
  viewChild,
} from '@angular/core';
import { RouterOutlet } from '@angular/router';
import { NgxSpinnerModule, NgxSpinnerService } from 'ngx-spinner';
import { HeaderComponent } from '@shared/header/header.component';
import { AnimationService } from '@services/animation/animation.service';
@Component({
  selector: 'app-root',
  imports: [RouterOutlet, NgxSpinnerModule, HeaderComponent],
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss'],
})
export class AppComponent {
  title = 'dokkan_ost';
  lwfInstance: any;
  lwfInstance2: any;
  showArtwork = signal(true);
  animationService = inject(AnimationService);

  readonly canvasRef =
    viewChild.required<ElementRef<HTMLCanvasElement>>('cardArtwork');
  readonly canvasIntro =
    viewChild.required<ElementRef<HTMLCanvasElement>>('cardIntro');
  readonly audioRef = viewChild.required<ElementRef<HTMLAudioElement>>('audio');

  previousTick = 0;
  private spinner = inject(NgxSpinnerService);

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

  playAnimation() {
    this.showArtwork.set(false);

    // Exemple de lecture audio
    // const audio = this.audioRef.nativeElement;
    // if (audio) {
    //   audio.volume = 0.03;
    //   audio.loop = true;
    //   audio.play();
    // }
    const canvas = this.canvasRef().nativeElement;

    LWF.ResourceCache.get().loadLWF({
      lwf: 'sp_effect_b4_00215.lwf',
      prefix: './intro/sp_effect_b4_00215/',
      stage: canvas,
      onload: (loadedLwfInstance: any) => {
        this.lwfInstance = loadedLwfInstance;
        this.canvasRef().nativeElement.classList.remove('artwork');
        this.canvasRef().nativeElement.classList.add('intro');

        // Si vous devez attacher une animation spécifique
        const attachedMovie = this.lwfInstance.rootMovie.attachMovie(
          'ef_001',
          'battle',
          1
        );
        if (attachedMovie) {
          // attachedMovie.play();

          // Centrer la scène
          attachedMovie.moveTo(
            this.lwfInstance.width / 1.5,
            this.lwfInstance.height / 2
          );

          // // Ajuster la mise à l'échelle
          attachedMovie.scaleX = 2; // Modifier la valeur pour ajuster
          attachedMovie.scaleY = 1.3;
          this.lwfInstance.scaleForHeight(canvas.width, canvas.height);
        }

        // Relancer le cycle d'animation
        // this.animate();
      },
      onerror: (error: any) => {
        console.error('Erreur lors du chargement de LWF :', error);
      },
    });

    // animate()
  }
}
