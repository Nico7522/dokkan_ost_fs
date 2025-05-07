import {
  ChangeDetectionStrategy,
  Component,
  ElementRef,
  inject,
  input,
  NgZone,
  PLATFORM_ID,
  viewChild,
} from '@angular/core';
import { Card } from '../../models/card.interface';
import { NgxSpinnerService } from 'ngx-spinner';
import { RouterModule } from '@angular/router';
import { isPlatformBrowser } from '@angular/common';
import { environment } from '../../../environments/environment';
import { AnimationService } from '@services/animation/animation.service';
import { Lwf } from 'app/models/lwf.type';
import { LwfMovie } from 'app/models/lwf-movie.type';

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
  lwfInstance: Lwf | null = null;
  attachedMovie: LwfMovie | null = null;
  animationId = 0;
  readonly canvasRef =
    viewChild.required<ElementRef<HTMLCanvasElement>>('cardRef');
  private readonly spinnerService = inject(NgxSpinnerService);
  private readonly animationService = inject(AnimationService);
  private ngZone = inject(NgZone);
  previousTick = 0;
  loadLWF() {
    this.ngZone.runOutsideAngular(() => {
      if (isPlatformBrowser(this.platformId)) {
        if (this.card().isLegendary) {
          const canvas = this.canvasRef().nativeElement;
          LWF.useCanvasRenderer();

          this.animationService
            .loadLwf({
              lwf: 'icon_rare_20000.lwf',
              prefix: './icon_rare/',
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
                this.attachedMovie.moveTo(
                  this.lwfInstance.width / 14,
                  this.lwfInstance.height / 25
                );
                this.attachedMovie.scaleX = 0.9;
                this.attachedMovie.scaleY = 0.9;

                this.animate();
                this.spinnerService.hide('loader');
              });
            })
            .catch((error: any) => {
              console.error('Erreur lors du chargement de LWF :', error);
            });
        } else {
          this.ngZone.run(() => {
            this.spinnerService.hide('loader');
          });
        }
      }
    });
  }

  // Version sans le service
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
      this.lwfInstance = null;
      cancelAnimationFrame(this.animationId);
    }
    if (this.attachedMovie) {
      this.attachedMovie.removeMovieClip();
      this.attachedMovie = null;
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
