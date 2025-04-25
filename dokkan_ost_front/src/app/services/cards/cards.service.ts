import { HttpClient } from '@angular/common/http';
import { inject, Injectable } from '@angular/core';
import { Observable, tap } from 'rxjs';
import { Card, CardDetails } from '../../models/card';
import { environment } from '../../../environments/environment';

@Injectable({
  providedIn: 'root',
})
export class CardsService {
  private readonly httpClient = inject(HttpClient);
  private readonly apiUrl = environment.API_URL;
  constructor() {}

  getCards(): Observable<{ data: Card[]; nbPage: number; total: number }> {
    return this.httpClient.get<{ data: Card[]; nbPage: number; total: number }>(
      `${this.apiUrl}/cards?page=1`
    );
  }

  getCardById(id: number): Observable<CardDetails> {
    return this.httpClient.get<CardDetails>(`${this.apiUrl}/cards/${id}`);
  }
}
