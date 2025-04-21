import { Component, signal } from '@angular/core';
import { RouterModule } from '@angular/router';
import {
  trigger,
  state,
  style,
  animate,
  transition,
  // ...
} from '@angular/animations';

@Component({
  selector: 'app-header',
  standalone: true,
  imports: [RouterModule],
  templateUrl: './header.component.html',
  styleUrl: './header.component.scss',
  animations: [
    trigger('menuAnimation', [
      transition(':enter', [
        style({ opacity: 0, transform: 'translateX(20px)' }),
        animate(
          '0.5s ease',
          style({ opacity: 1, transform: 'translateX(0px)' })
        ),
      ]),
      transition(':leave', [
        animate(
          '0.5s ease',
          style({ opacity: 0, transform: 'translateX(20px)' })
        ),
      ]),
    ]),
  ],
})
export class HeaderComponent {
  isMenuClosed = signal(false);
  isInfoDivClosed = signal(false);
  closeMenu() {
    this.isMenuClosed.set(false);
  }

  openMenu() {
    this.isMenuClosed.set(true);
  }

  closeInfo() {
    this.isInfoDivClosed.set(true);
  }
}
