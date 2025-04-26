import { Component, inject, PLATFORM_ID } from '@angular/core';
import { CardsService } from '../../../services/cards/cards.service';
import { NgxSpinnerComponent, NgxSpinnerService } from 'ngx-spinner';
import { map } from 'rxjs';
import { keysToCamel } from '../../../helpers/helpers';
import { isPlatformBrowser } from '@angular/common';
import { CardComponent } from '../../../shared/card/card.component';
import { Router, RouterOutlet } from '@angular/router';
import { Card } from '../../../models/card';

@Component({
  selector: 'app-cards',
  imports: [CardComponent, RouterOutlet, NgxSpinnerComponent],
  templateUrl: './card-list.component.html',
  styleUrl: './card-list.component.scss',
})
export class CardsComponent {
  plateformId = inject(PLATFORM_ID);
  isServer = isPlatformBrowser(this.plateformId);

  // Resolver
  // cards = input<Card[]>([]);
  private readonly cardService = inject(CardsService);
  private readonly spinnerService = inject(NgxSpinnerService);
  private readonly router = inject(Router);
  // cardData$ = this.cardService.getCards().pipe(
  //   map((result) => {
  //     this.spinnerService.show('cards');
  //     let cards = result.data.map((c) => keysToCamel(c));
  //     return {
  //       cards,
  //       total: result.total,
  //       nbPage: result.nbPage,
  //     };
  //   })
  // );

  result = this.cardService.cards.value;
  setPage(pageNumber: number) {
    this.updateQueryParams({ page: pageNumber.toString() });
    this.cardService.setPage(pageNumber.toString());
  }
  private updateQueryParams(queryParams: Record<string, string>) {
    this.router.navigate([], {
      queryParams,
      queryParamsHandling: 'merge',
    });
  }
}
