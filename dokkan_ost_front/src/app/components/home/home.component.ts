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
  offset = 0;
  onPreviousCard() {
    this.offset -= 20;
    this.homeService.onOffsetChange(this.offset);
  }
  onNextCards() {
    this.offset += 20;
    this.homeService.onOffsetChange(this.offset);
  }
  cards = this.homeService.cards.value;
}
