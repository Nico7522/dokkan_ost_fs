import {
  ChangeDetectionStrategy,
  Component,
  computed,
  ElementRef,
  inject,
  input,
  NgZone,
  PLATFORM_ID,
  signal,
  ViewChild,
} from '@angular/core';
import { Card } from '../../models/card';
import { NgxSpinnerService } from 'ngx-spinner';
import { Router, RouterModule } from '@angular/router';
import { isPlatformBrowser } from '@angular/common';
import { environment } from '../../../environments/environment';
import { AnimationService } from '../../services/animation/animation.service';

@Component({
  selector: 'app-card',
  standalone: true,
  changeDetection: ChangeDetectionStrategy.OnPush,
  imports: [RouterModule],
  templateUrl: './card.component.html',
  styleUrl: './card.component.scss',
})
export class CardComponent {
  private platformId = inject(PLATFORM_ID);
  readonly apiUrl = environment.API_URL;
  card = input.required<Card>();
  lwfInstance: any;
  animationId = 0;
  timeOut: any;
  @ViewChild('cardRef', { static: false })
  canvasRef!: ElementRef<HTMLCanvasElement>;
  private readonly spinnerService = inject(NgxSpinnerService);
  private readonly router = inject(Router);
  private readonly animationService = inject(AnimationService);
  private ngZone = inject(NgZone);
  attachedMovie: any;
  previousTick = 0;

  loadLWF() {
    this.ngZone.runOutsideAngular(() => {
      if (isPlatformBrowser(this.platformId)) {
        if (this.card().isLegendary) {
          const canvas = this.canvasRef.nativeElement;
          LWF.useCanvasRenderer();
          console.log('legendary');

          this.animationService
            .loadLwf('icon_rare_20000', {
              lwf: 'icon_rare_20000.lwf',
              prefix: './icon_rare/',
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
                    1
                  );
                  attachedMovie.moveTo(
                    this.lwfInstance.width / 14,
                    this.lwfInstance.height / 25
                  );
                  attachedMovie.scaleX = 0.9;
                  attachedMovie.scaleY = 0.9;

                  this.animate();
                  this.spinnerService.hide('loader');
                  this.spinnerService.hide('cards');
                }
              });
            })
            .catch((error: any) => {
              console.error('Erreur lors du chargement de LWF :', error);
            });
        } else {
          this.ngZone.run(() => {
            this.spinnerService.hide('loader');
            this.spinnerService.hide('card');
          });
        }
      }
    });
  }

  // Version dans le service
  // loadLWF() {
  //   this.ngZone.runOutsideAngular(() => {
  //     if (isPlatformBrowser(this.platformId)) {
  //       if (this.card().isLegendary) {
  //         const canvas = this.canvasRef.nativeElement;

  //         LWF.useCanvasRenderer();
  //         LWF.ResourceCache.get().loadLWF({
  //           lwf: 'icon_rare_20000.lwf',
  //           prefix: './icon_rare/',
  //           stage: canvas,
  //           onload: (loadedLwfInstance: any) => {
  //             this.ngZone.run(() => {
  //               this.lwfInstance = loadedLwfInstance;

  //               this.attachedMovie = this.lwfInstance.rootMovie.attachMovie(
  //                 'ef_001',
  //                 'battle',
  //                 1
  //               );
  //               this.attachedMovie.moveTo(
  //                 this.lwfInstance.width / 14,
  //                 this.lwfInstance.height / 25
  //               );

  //               this.attachedMovie.scaleX = 0.9;
  //               this.attachedMovie.scaleY = 0.9;

  //               this.animate();
  //               this.spinnerService.hide('loader');
  //               this.spinnerService.hide('cards');
  //             });
  //           },
  //           onerror: (error: any) => {
  //             console.error('Erreur lors du chargement de LWF :', error);
  //           },
  //         });
  //       } else {
  //         this.ngZone.run(() => {
  //           this.spinnerService.hide('loader');
  //         });
  //       }
  //     }
  //   });
  // }

  ngAfterViewInit() {
    this.ngZone.runOutsideAngular(() => {
      this.loadLWF();
    });
  }

  ngOnDestroy() {
    if (this.lwfInstance) {
      this.lwfInstance.destroy();
      cancelAnimationFrame(this.animationId);
    }
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

  goToDetails() {
    this.router.navigate(['/cards/', this.card().id]);
  }

  // playAnimation() {
  //   this.showArtwork.set(false);

  //   // Exemple de lecture audio
  //   // const audio = this.audioRef.nativeElement;
  //   // if (audio) {
  //   //   audio.volume = 0.03;
  //   //   audio.loop = true;
  //   //   audio.play();
  //   // }
  //   const canvas = this.canvasRef.nativeElement;

  //   LWF.ResourceCache.get().loadLWF({
  //     lwf: 'sp_effect_b4_00215.lwf',
  //     prefix: './intro/sp_effect_b4_00215/',
  //     stage: canvas,
  //     onload: (loadedLwfInstance: any) => {
  //       this.lwfInstance = loadedLwfInstance;
  //       this.canvasRef.nativeElement.classList.remove('artwork');
  //       this.canvasRef.nativeElement.classList.add('intro');

  //       // Si vous devez attacher une animation spécifique
  //       const attachedMovie = this.lwfInstance.rootMovie.attachMovie(
  //         'ef_001',
  //         'battle',
  //         1
  //       );
  //       if (attachedMovie) {
  //         // attachedMovie.play();

  //         // Centrer la scène
  //         attachedMovie.moveTo(
  //           this.lwfInstance.width / 1.5,
  //           this.lwfInstance.height / 2
  //         );

  //         // // Ajuster la mise à l'échelle
  //         attachedMovie.scaleX = 2; // Modifier la valeur pour ajuster
  //         attachedMovie.scaleY = 1.3;
  //         this.lwfInstance.scaleForHeight(canvas.width, canvas.height);
  //       }

  //       // Relancer le cycle d'animation
  //       // this.animate();
  //     },
  //     onerror: (error: any) => {
  //       console.error('Erreur lors du chargement de LWF :', error);
  //     },
  //   });

  //   // animate()
  // }
}
