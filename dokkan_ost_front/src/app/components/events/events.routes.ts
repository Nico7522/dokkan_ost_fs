import { Route } from '@angular/router';
import { EventListComponent } from './event-list/event-list.component';
import { EventDetailsComponent } from './event-details/event-details.component';

const EVENTS_ROUTES: Route[] = [
  {
    path: '',
    component: EventListComponent,
  },
  {
    path: ':id/levels',
    component: EventDetailsComponent,
  },
];

export default EVENTS_ROUTES;
