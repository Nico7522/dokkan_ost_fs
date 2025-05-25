import { Route } from '@angular/router';
import { EventListComponent } from './event-list/event-list.component';
import { EventDetailsComponent } from './event-details/event-details.component';
import { LevelDetailsComponent } from './level-details/level-details.component';

const EVENTS_ROUTES: Route[] = [
  {
    path: '',
    component: EventListComponent,
  },
  {
    path: ':id/levels',
    component: EventDetailsComponent,
  },
  {
    path: ':id/levels/:levelId',
    component: LevelDetailsComponent,
  },
];

export default EVENTS_ROUTES;
