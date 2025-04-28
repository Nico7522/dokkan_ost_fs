import { HttpClient } from '@angular/common/http';
import { inject, Injectable, signal } from '@angular/core';
import {
  debounce,
  debounceTime,
  distinctUntilChanged,
  filter,
  map,
  Observable,
  of,
  switchMap,
  tap,
} from 'rxjs';
import { Card, CardDetails } from '../../models/card.interface';
import { environment } from '../../../environments/environment';
import { rxResource } from '@angular/core/rxjs-interop';
import { keysToCamel } from '../../helpers/helpers';
import { toNamespacedPath } from 'path/posix';
import { ApiResponse } from 'app/models/api-response.interface';
import { FinishSkill } from 'app/models/finish-skill.interface';

@Injectable({
  providedIn: 'root',
})
export class CardsService {
  private readonly httpClient = inject(HttpClient);
  private readonly apiUrl = environment.API_URL;
  constructor() {}

  getCards(): Observable<ApiResponse<Card[]>> {
    return this.httpClient.get<ApiResponse<Card[]>>(
      `${this.apiUrl}/cards?page=1`
    );
  }

  getCardById(id: number): Observable<CardDetails> {
    return this.httpClient.get<CardDetails>(`${this.apiUrl}/cards/${id}`).pipe(
      switchMap((card) => {
        card = keysToCamel(card);
        if (card.hasFinishSkill) {
          return this.httpClient
            .get<FinishSkill[]>(`${this.apiUrl}/cards/${id}/finishskills`)
            .pipe(
              map((finishSkills) => {
                card.finishSkills = finishSkills;
                return card;
              })
            );
        }
        return of(card);
      })
    );
  }

  private _page = signal('1');
  page = this._page.asReadonly();
  setPage(pageNumber: string) {
    this._page.set(pageNumber);
  }

  private _name = signal('');
  name = this._name.asReadonly();
  onSearch(name: string) {
    this._name.set(name);
  }
  cards = rxResource({
    request: () => ({
      page: this._page(),
      name: this._name(),
    }),
    loader: ({ request }) =>
      this.httpClient
        .get<ApiResponse<Card[]>>(
          `${this.apiUrl}/cards?page=${request.page}&name=${request.name}`
        )
        .pipe(
          debounceTime(500),
          distinctUntilChanged(),
          map((result) => {
            let cards = result.data.map((c) => keysToCamel(c));
            return {
              cards,
              total: result.total,
              nbPage: result.nbPage,
            };
          })
        ),
    defaultValue: { cards: [], nbPage: 0, total: 0 },
  });
}
