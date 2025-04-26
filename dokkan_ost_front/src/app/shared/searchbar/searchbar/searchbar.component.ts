import { Component, output, Output, signal } from '@angular/core';

@Component({
  selector: 'app-searchbar',
  imports: [],
  templateUrl: './searchbar.component.html',
  styleUrl: './searchbar.component.scss',
})
export class SearchbarComponent {
  showResetButton = signal(false);
  cardName = output<string>();
  onSearch(name: string) {
    this.cardName.emit(name);
    this.showResetButton.set(true);
  }
  reset() {
    this.onSearch('');
    this.showResetButton.set(false);
  }
}
