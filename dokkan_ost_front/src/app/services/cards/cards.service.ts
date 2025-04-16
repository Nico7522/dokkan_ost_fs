import { HttpClient, httpResource } from '@angular/common/http';
import { computed, inject, Injectable } from '@angular/core';
import { BehaviorSubject, map, Observable, shareReplay, tap } from 'rxjs';
import { Card, CardDetails } from '../../models/card';
import { environment } from '../../../environments/environment.development';

@Injectable({
  providedIn: 'root',
})
export class CardsService {
  private readonly httpClient = inject(HttpClient);
  private readonly apiUrl = environment.API_URL;
  constructor() {}

  getCards(): Observable<Card[]> {
    return this.httpClient.get<Card[]>(`${this.apiUrl}/cards`);
  }

  getCardById(id: number) {
    return this.httpClient.get<CardDetails>(`${this.apiUrl}/cards/${id}`);
  }
}
