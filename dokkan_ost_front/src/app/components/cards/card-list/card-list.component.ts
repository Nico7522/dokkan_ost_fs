import { Component, computed, inject, PLATFORM_ID } from '@angular/core';
import { CardsService } from '@services/cards/cards.service';
import { NgxSpinnerComponent, NgxSpinnerService } from 'ngx-spinner';
import { isPlatformBrowser } from '@angular/common';
import { CardComponent } from '@shared/card/card.component';
import { Router, RouterOutlet } from '@angular/router';
import { SearchbarComponent } from '@shared/searchbar/searchbar.component';
import { Card } from 'app/models/card.interface';

@Component({
  selector: 'app-cards',
  imports: [
    CardComponent,
    RouterOutlet,
    NgxSpinnerComponent,
    SearchbarComponent,
  ],
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
  page = this.cardService.page;
  name = this.cardService.name;
  onSearchByName(name: string) {
    this.cardService.onSearch(name);
    this.updateQueryParams({ name });
  }
  ngOnInit() {
    if (this.name()) {
      this.cardService.onSearch('');
    }
    this.spinnerService.show('loader');
    this.updateQueryParams({ page: this.page() });
  }
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
  error = computed(() => {
    return this.cardService.cards.error();
  });
  nbButton = computed(() => Array(this.result()?.nbPage));
  noResultFound = computed(
    () => this.result().cards.length <= 0 && !this.error()
  );
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
