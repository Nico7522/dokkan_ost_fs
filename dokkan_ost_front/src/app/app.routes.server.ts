import { inject } from '@angular/core';
import { RenderMode, ServerRoute } from '@angular/ssr';
import { CardsService } from './services/cards/cards.service';
import { map } from 'rxjs';

export const serverRoutes: ServerRoute[] = [
  {
    path: '**',
    renderMode: RenderMode.Prerender,
  },
  {
    path: 'home',
    renderMode: RenderMode.Prerender,
  },
  {
    path: 'cards',
    renderMode: RenderMode.Prerender,
  },
  {
    path: 'cards/:id',
    renderMode: RenderMode.Prerender,
  },
];
