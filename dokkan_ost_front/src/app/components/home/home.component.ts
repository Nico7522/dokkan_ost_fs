import { Component, computed, inject, input, signal } from '@angular/core';
import { HomeService } from '@services/home/home.service';
import { CardComponent } from '@shared/card/card.component';
import { NgxSpinnerService } from 'ngx-spinner';
import { Router } from '@angular/router';
import { ErrorComponent } from '@shared/error/error.component';

@Component({
  selector: 'app-home',
  standalone: true,
  imports: [CardComponent, ErrorComponent],
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
  }
  cards = this.homeService.cards.value;
  error = computed(() => {
    this.spinnerService.hide('loader');
    return this.homeService.cards.error;
  });
  private updateQueryParams(queryParams: string) {
    this.router.navigate([], {
      queryParams: { offset: queryParams, limit: 20 },
    });
  }
}
