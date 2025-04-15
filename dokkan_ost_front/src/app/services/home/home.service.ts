import { HttpClient, httpResource } from '@angular/common/http';
import { inject, Injectable, signal } from '@angular/core';
import { Card } from '../../models/card';
import { Observable } from 'rxjs';
import { keysToCamel } from '../../helpers/helpers';

@Injectable({
  providedIn: 'root',
})
export class HomeService {
  private readonly httpClient = inject(HttpClient);
  constructor() {}

  getCards(offset: number): Observable<Card[]> {
    return this.httpClient.get<Card[]>(
      'http://localhost:3200/home?offset=' + offset
    );
  }
  private _offset = signal(0);
  offset = this._offset.asReadonly();
  getNextCards() {
    this._offset.set(this._offset() + 20);
  }
  getPreviousCards() {
    this._offset.set(this._offset() - 20);
  }
  cards = httpResource<Card[]>(
    () => 'http://localhost:3200/home?offset=' + this._offset(),
    {
      defaultValue: [],
      parse: (value) =>
        (value as Card[]).map((c) => {
          c = keysToCamel(c);
          return c;
        }),
    }
  );
}
