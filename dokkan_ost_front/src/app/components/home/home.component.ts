import { Component, computed, inject } from '@angular/core';

import { HomeService } from '../../services/home/home.service';
import { CardComponent } from '../../shared/card/card.component';
import { keysToCamel } from '../../helpers/helpers';
import { NgxSpinnerService } from 'ngx-spinner';

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

  ngOnInit() {
    this.spinnerService.show('loader');
  }
  offset = this.homeService.offset;
  onPreviousCard() {
    this.homeService.getPreviousCards();
  }
  onNextCards() {
    this.homeService.getNextCards();
  }
  cards = this.homeService.cards.value;
}
