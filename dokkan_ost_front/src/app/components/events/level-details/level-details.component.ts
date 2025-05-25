import { AsyncPipe } from '@angular/common';
import { Component, inject, input, signal } from '@angular/core';
import { toObservable } from '@angular/core/rxjs-interop';
import { EventService } from '@services/event/event.service';
import { CardComponent } from '@shared/card/card.component';
import { catchError, EMPTY, switchMap, tap } from 'rxjs';

@Component({
  selector: 'app-level-details',
  imports: [AsyncPipe, CardComponent],
  templateUrl: './level-details.component.html',
  styleUrl: './level-details.component.scss',
})
export class LevelDetailsComponent {
  private readonly eventService = inject(EventService);
  error = signal('');
  levelId = input<string>('');
  levelInfo$ = toObservable(this.levelId).pipe(
    switchMap((id) => {
      return this.eventService.getLevelInfo(+id).pipe(
        tap((data) => console.log(data)),
        catchError(() => {
          this.error.set("Card can't be fetch");
          return EMPTY;
        })
      );
    })
  );
}
