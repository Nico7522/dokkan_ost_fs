import { Card } from './card.interface';

export interface Round {
  roundNb: number;
  card: Card;
}

export interface ApiRoundResponse {
  class: string;
  id: number;
  isLegendary: boolean;
  name: string;
  roundNb: number;
  thumb: number;
  type: string;
}
