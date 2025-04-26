import { HttpClient } from '@angular/common/http';
import { inject, Injectable, signal } from '@angular/core';
import { map, Observable, tap } from 'rxjs';
import { Card, CardDetails } from '../../models/card';
import { environment } from '../../../environments/environment';
import { rxResource } from '@angular/core/rxjs-interop';
import { keysToCamel } from '../../helpers/helpers';

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

  private page = signal('1');
  private name = signal('');
  setPage(pageNumber: string) {
    this.page.set(pageNumber);
  }
  cards = rxResource({
    request: () => ({
      page: this.page(),
      name: this.name(),
    }),
    loader: ({ request }) =>
      this.httpClient
        .get<{ data: Card[]; nbPage: number; total: number }>(
          `${this.apiUrl}/cards?page=${request.page}&name=${request.name}`
        )
        .pipe(
          map((result) => {
            let cards = result.data.map((c) => keysToCamel(c));
            return {
              cards,
              total: result.total,
              nbPage: result.nbPage,
            };
          })
        ),
  });
}
