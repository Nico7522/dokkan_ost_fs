import { Component, inject, PLATFORM_ID, input } from '@angular/core';
import { CardsService } from '../../../services/cards/cards.service';
import { NgxSpinnerComponent, NgxSpinnerService } from 'ngx-spinner';
import { map } from 'rxjs';
import { keysToCamel } from '../../../helpers/helpers';
import { AsyncPipe, isPlatformBrowser } from '@angular/common';
import { CardComponent } from '../../../shared/card/card.component';
import { RouterOutlet } from '@angular/router';
import { Card } from '../../../models/card';

@Component({
  selector: 'app-cards',
  imports: [AsyncPipe, CardComponent, RouterOutlet, NgxSpinnerComponent],
  templateUrl: './card-list.component.html',
  styleUrl: './card-list.component.scss',
})
export class CardsComponent {
  plateformId = inject(PLATFORM_ID);
  isServer = isPlatformBrowser(this.plateformId);

  // Resolver
  cards = input<Card[]>([]);
  private readonly cardService = inject(CardsService);
  private readonly spinnerService = inject(NgxSpinnerService);
  cardData$ = this.cardService.getCards().pipe(
    map((result) => {
      console.log(result.total, result.nbPage);
      this.spinnerService.show('cards');
      let c = result.data.map((c) => keysToCamel(c));

      return {
        cards: c,
        total: result.total,
        nbPage: result.nbPage,
      };
    })
  );
}
