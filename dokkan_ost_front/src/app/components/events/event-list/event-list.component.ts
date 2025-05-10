import { AsyncPipe } from '@angular/common';
import { Component, inject } from '@angular/core';
import { RouterModule } from '@angular/router';
import { EventService } from '@services/event/event.service';
import { environment } from 'environments/environment';

@Component({
  selector: 'app-event-list',
  imports: [AsyncPipe, RouterModule],
  templateUrl: './event-list.component.html',
  styleUrl: './event-list.component.scss',
})
export class EventListComponent {
  private readonly eventService = inject(EventService);
  apiUrl = environment.API_URL;
  events$ = this.eventService.getEvents();
}
