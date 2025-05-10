import { HttpClient } from '@angular/common/http';
import { inject, Injectable } from '@angular/core';
import { Event } from 'app/models/event.interface';
import { Level } from 'app/models/level.interface';
import { environment } from 'environments/environment';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root',
})
export class EventService {
  private readonly httpService = inject(HttpClient);
  apiUrl = environment.API_URL;
  constructor() {}

  getEvents(): Observable<Event[]> {
    return this.httpService.get<Event[]>(`${this.apiUrl}/events`);
  }

  getEventById(id: number): Observable<Level[]> {
    console.log(id);

    return this.httpService.get<Level[]>(`${this.apiUrl}/events/${id}/levels`);
  }
}
