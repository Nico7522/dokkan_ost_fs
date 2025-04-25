import { ResolveFn } from '@angular/router';
import { Card } from '../../models/card';
import { Observable, of, tap } from 'rxjs';
import { CardsService } from './cards.service';
import { inject, makeStateKey, StateKey, TransferState } from '@angular/core';
const cardsState: StateKey<Card[]> = makeStateKey<Card[]>('cards');

// export const cardsResolver: ResolveFn<Card[]> = (
//   route,
//   state
// ): Observable<Card[]> => {
//   // const cardsService = inject(CardsService);
//   // const transferState: TransferState = inject(TransferState);

//   // if (transferState.hasKey(cardsState)) {
//   //   console.log('cards already fetched');
//   //   return of(transferState.get<Card[]>(cardsState, [] as Card[]));
//   // }

//   // return cardsService.getCards().pipe(
//   //   tap((cards: Card[]) => {
//   //     transferState.set<Card[]>(cardsState, cards);
//   //   })
//   // );
// };
