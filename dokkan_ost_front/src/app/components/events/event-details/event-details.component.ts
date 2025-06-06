import { AsyncPipe } from '@angular/common';
import { Component, inject, input, signal } from '@angular/core';
import { toObservable } from '@angular/core/rxjs-interop';
import { RouterModule } from '@angular/router';
import { EventService } from '@services/event/event.service';
import { catchError, EMPTY, switchMap, tap } from 'rxjs';

@Component({
  selector: 'app-event-details',
  imports: [AsyncPipe, RouterModule],
  templateUrl: './event-details.component.html',
  styleUrl: './event-details.component.scss',
})
export class EventDetailsComponent {
  private readonly eventService = inject(EventService);
  error = signal('');
  id = input<string>('');
  levels$ = toObservable(this.id).pipe(
    switchMap((id) => {
      return this.eventService.getEventById(+id).pipe(
        catchError(() => {
          this.error.set("Card can't be fetch");
          return EMPTY;
        })
      );
    })
  );
}
