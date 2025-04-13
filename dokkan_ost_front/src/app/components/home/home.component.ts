import { Component, inject } from '@angular/core';

import { CardsComponent } from '../cards/card-list/card-list.component';

@Component({
  selector: 'app-home',
  standalone: true,
  imports: [CardsComponent],
  templateUrl: './home.component.html',
  styleUrl: './home.component.scss',
})
export class HomeComponent {}
