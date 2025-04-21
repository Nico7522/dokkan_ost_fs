import { HttpClient } from '@angular/common/http';
import { inject, Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { Card, CardDetails } from '../../models/card';
import { environment } from '../../../environments/environment';

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
