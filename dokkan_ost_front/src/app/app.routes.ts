import { Routes } from '@angular/router';
import { HomeComponent } from './components/home/home.component';

export const routes: Routes = [
  {
    path: '',
    redirectTo: 'home',
    pathMatch: 'full',
  },
  {
    path: 'home',
    component: HomeComponent,
  },
  {
    path: 'cards',
    loadChildren: () => import('./components/cards/cards.routes'),
  },
  {
    path: 'events',
    loadChildren: () => import('./components/events/events.routes'),
  },
];
