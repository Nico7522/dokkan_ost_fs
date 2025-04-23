import { Component, inject, input, signal } from '@angular/core';

import { HomeService } from '../../services/home/home.service';
import { CardComponent } from '../../shared/card/card.component';
import { NgxSpinnerService } from 'ngx-spinner';
import { Router } from '@angular/router';

@Component({
  selector: 'app-home',
  standalone: true,
  imports: [CardComponent],
  templateUrl: './home.component.html',
  styleUrl: './home.component.scss',
})
export class HomeComponent {
  private readonly spinnerService = inject(NgxSpinnerService);
  private readonly homeService = inject(HomeService);
  private readonly router = inject(Router);

  // Récup le params
  readonly offsetPage = input(0, { alias: 'offset' });
  ngOnInit() {
    this.spinnerService.show('loader');
    this.homeService.setOffset(this.offsetPage());
  }
  offset = signal(0);
  onPreviousCard() {
    this.offset.update((offset) => offset - 20);
    this.homeService.setOffset(this.offset());
    this.updateQueryParams(this.offset().toString());
  }
  onNextCards() {
    this.offset.update((offset) => offset + 20);
    this.homeService.setOffset(this.offset());
    this.updateQueryParams(this.offset().toString());
    console.log('cc');
  }
  cards = this.homeService.cards.value;

  private updateQueryParams(queryParams: string) {
    this.router.navigate([], {
      queryParams: { offset: queryParams },
    });
  }
}
