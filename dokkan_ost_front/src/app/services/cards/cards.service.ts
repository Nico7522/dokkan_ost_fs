import { HttpClient, httpResource } from '@angular/common/http';
import { computed, inject, Injectable } from '@angular/core';
import { BehaviorSubject, map, Observable, shareReplay, tap } from 'rxjs';
import { Card, CardDetails } from '../../models/card';

@Injectable({
  providedIn: 'root',
})
export class CardsService {
  private readonly httpClient = inject(HttpClient);
  constructor() {}

  getCards(): Observable<Card[]> {
    return this.httpClient.get<Card[]>('http://localhost:3200/home?offset=0');
  }

  getCardById(id: number) {
    return this.httpClient.get<CardDetails>(
      'http://localhost:3200/cards/' + id
    );
  }
}
