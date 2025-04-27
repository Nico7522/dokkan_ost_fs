import { Component, output, Output, signal } from '@angular/core';

@Component({
  selector: 'app-searchbar',
  imports: [],
  templateUrl: './searchbar.component.html',
  styleUrl: './searchbar.component.scss',
})
export class SearchbarComponent {
  showResetButton = signal(false);
  searchByName = output<string>();
  onSearch(name: string) {
    if (!name) {
      return;
    }

    this.searchByName.emit(name);
    this.showResetButton.set(true);
  }
  reset() {
    this.searchByName.emit('');
    this.showResetButton.set(false);
  }
}
