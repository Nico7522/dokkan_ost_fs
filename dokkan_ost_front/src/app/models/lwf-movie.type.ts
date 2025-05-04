export type LwfMovie = {
  removeMovieClip: () => void;
  moveTo: (width: number, height: number) => LwfMovie;
  gotoAndPlay: () => void;
  gotoAndStop: () => void;
  scaleX: number;
  scaleY: number;
};
