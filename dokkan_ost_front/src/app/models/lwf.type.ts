import { LwfMovie } from './lwf-movie.type';

export type Lwf = {
  rootMovie: {
    attachMovie: (scene: string, name: string, priority: number) => LwfMovie;
  };
  exec: (fn: number) => void;
  render: () => void;
  destroy: () => void;
  width: number;
  height: number;
};
