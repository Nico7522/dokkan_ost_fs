import { HttpClient } from '@angular/common/http';
import { inject, Injectable } from '@angular/core';
import { Observable, tap } from 'rxjs';
import { Card, CardDetails } from '../../models/card';

@Injectable({
  providedIn: 'root',
})
export class CardsService {
  private readonly _httpClient = inject(HttpClient);
  constructor() {}

  getCards(): Observable<Card[]> {
    return this._httpClient.get<Card[]>('http://localhost:3200/cards');
  }

  getCardById(id: number) {
    return this._httpClient.get<CardDetails>(
      'http://localhost:3200/cards/' + id
    );
  }

  getFile() {
    return this._httpClient
      .get('http://localhost:3200/file')
      .subscribe((blob) => {
        console.log(blob);

        // const a = document.createElement('a');
        // const objectUrl = URL.createObjectURL(blob);
        // a.href = objectUrl;
        // a.download = 'file.pdf';
        // a.click();
        // URL.revokeObjectURL(objectUrl);
      });
  }
}
