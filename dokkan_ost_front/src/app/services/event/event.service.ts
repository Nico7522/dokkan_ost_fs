import { HttpClient } from '@angular/common/http';
import { inject, Injectable } from '@angular/core';
import { keysToCamel } from 'app/helpers/helpers';
import { Card } from 'app/models/card.interface';
import { Event } from 'app/models/event.interface';
import { Level } from 'app/models/level.interface';
import { ApiRoundResponse, Round } from 'app/models/round.interface';
import { environment } from 'environments/environment';
import { map, Observable } from 'rxjs';

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
    return this.httpService.get<Level[]>(`${this.apiUrl}/events/${id}/levels`);
  }

  getLevelInfo(id: number): Observable<any> {
    return this.httpService.get<any>(`${this.apiUrl}/levels/${id}`);
  }
}
