import { Route } from '@angular/router';
import { EventListComponent } from './event-list/event-list.component';

const EVENTS_ROUTES: Route[] = [
  {
    path: '',
    component: EventListComponent,
  },
];

export default EVENTS_ROUTES;
