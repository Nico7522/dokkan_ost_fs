import { HttpClient, HttpHeaders, httpResource } from '@angular/common/http';
import { inject, Injectable, input, signal } from '@angular/core';
import { Card } from '../../models/card.interface';
import { Observable } from 'rxjs';
import { keysToCamel } from '../../helpers/helpers';
import { environment } from '../../../environments/environment';
@Injectable({
  providedIn: 'root',
})
export class HomeService {
  private readonly httpClient = inject(HttpClient);
  private readonly apiUrl = environment.API_URL;
  constructor() {}

  getCards(offset: number): Observable<Card[]> {
    return this.httpClient.get<Card[]>(`${this.apiUrl}/home?offset=${offset}`);
  }
  private _offset = signal(0);
  offset = this._offset.asReadonly();
  setOffset(offset: number) {
    this._offset.set(offset);
  }

  cards = httpResource<Card[]>(() => ({
    url: this._offset()
      ? `${this.apiUrl}/home?offset=${this._offset()}`
      : `${this.apiUrl}/home?offset=0`,
    defaultValue: [],
  }));
}
