import { RenderMode, ServerRoute } from '@angular/ssr';

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
    renderMode: RenderMode.Server,
  },
];
