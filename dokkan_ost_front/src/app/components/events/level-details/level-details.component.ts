import { AsyncPipe } from '@angular/common';
import {
  Component,
  ElementRef,
  inject,
  input,
  signal,
  viewChild,
} from '@angular/core';
import { toObservable } from '@angular/core/rxjs-interop';
import { EventService } from '@services/event/event.service';
import { CardComponent } from '@shared/card/card.component';
import { PlayButtonComponent } from '@shared/play-button/play-button.component';
import { environment } from 'environments/environment';
import { catchError, EMPTY, switchMap, tap } from 'rxjs';

@Component({
  selector: 'app-level-details',
  imports: [AsyncPipe, CardComponent, PlayButtonComponent],
  templateUrl: './level-details.component.html',
  styleUrl: './level-details.component.scss',
})
export class LevelDetailsComponent {
  private readonly eventService = inject(EventService);
  readonly ostRef = viewChild<ElementRef<HTMLAudioElement> | null>('ostRef');
  ostText = signal('Play OST');
  apiUrl = environment.API_URL;
  error = signal('');
  levelId = input<string>('');
  levelInfo$ = toObservable(this.levelId).pipe(
    switchMap((id) => {
      return this.eventService.getLevelInfo(+id).pipe(
        tap((data) => console.log(data)),
        catchError(() => {
          this.error.set('Error');
          return EMPTY;
        })
      );
    })
  );

  playOst() {
    const ref = this.ostRef()?.nativeElement;
    if (ref) {
      if (ref.paused) {
        ref.volume = 0.03;
        ref.loop = true;
        ref.play();
        this.ostText.set('Pause OST');
      } else {
        ref.pause();
        this.ostText.set('Play OST');
      }
    }
  }
}
