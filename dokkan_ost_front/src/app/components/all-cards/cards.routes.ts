import { Route } from '@angular/router';
import { CardComponent } from '../../shared/card/card.component';
import { CardDetailsComponent } from './card-details/card-details.component';
import { CardsComponent } from './cards/card-list.component';
import { cardsResolver } from '../../services/cards/cards-resolver.service';

const CARDS_ROUTES: Route[] = [
  {
    path: '',
    component: CardsComponent,
    resolve: {
      cards: cardsResolver,
    },
  },
  {
    path: ':id',
    component: CardDetailsComponent,
  },
];

export default CARDS_ROUTES;
