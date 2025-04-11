export const toCamel = (s: string) => {
  return s.replace(/([-_][a-z])/gi, ($1) => {
    return $1.toUpperCase().replace('-', '').replace('_', '');
  });
};

export const keysToCamel = (o: any): any => {
  if (o === Object(o) && !Array.isArray(o) && typeof o !== 'function') {
    const n: { [key: string]: any } = {};
    Object.keys(o).forEach((k) => {
      n[toCamel(k)] = keysToCamel(o[k]);
    });
    return n;
  } else if (Array.isArray(o)) {
    return o.map((i) => {
      return keysToCamel(i);
    });
  }
  return o;
};

export function forceReplay(
  lwfInstance: any,
  attachedMovie: any,
  sceneName: string
) {
  attachedMovie.addEventHandler('update', () => {
    if (attachedMovie.currentFrame >= attachedMovie.totalFrames - 1) {
      attachedMovie = lwfInstance.rootMovie.attachMovie(sceneName, 'battle', 1);
      if (attachedMovie) {
        attachedMovie.moveTo(lwfInstance.width / 2, lwfInstance.height / 2);
      }
      forceReplay(lwfInstance, attachedMovie, sceneName);
    }
  });
}

// Attache une ou plusieurs scènes
export function triggerNextScenes(
  attachedMovie: any,
  lwfInstance: any,
  scenes: string[]
) {
  let attachedMovieBase;
  let attachedMovie2;
  let attachedMovie3;
  for (let i = 0; i < scenes.length; i++) {
    if (i === 0) {
      attachedMovie = lwfInstance.rootMovie.attachMovie(scenes[i], 'battle', 1);
      if (attachedMovie) {
        attachedMovie.moveTo(lwfInstance.width / 2, lwfInstance.height / 2);
      }
      attachedMovieBase = attachedMovie;
    }
    if (i === 1) {
      attachedMovie2 = lwfInstance.rootMovie.attachMovie(
        scenes[i],
        'battle2',
        1
      );
      if (attachedMovie2) {
        attachedMovie2.moveTo(lwfInstance.width / 2, lwfInstance.height / 2);
      }
    }
    if (i === 2) {
      attachedMovie3 = lwfInstance.rootMovie.attachMovie(
        scenes[i],
        'battle',
        1
      );
      if (attachedMovie3) {
        attachedMovie3.moveTo(lwfInstance.width / 2, lwfInstance.height / 2);
      }
    }
  }

  return { attachedMovieBase, attachedMovie2, attachedMovie3 };
}

// Attache une scène, check quand elle se termine et passe à la suivante.
export function updateScene(
  lwfInstance: any,
  attachedMovie: any,
  scenes: string[],
  increment: number
) {
  increment += 1;
  if (attachedMovie) {
    attachedMovie.moveTo(lwfInstance.width / 2, lwfInstance.height / 2);
  }
  if (increment === scenes.length) increment = 0;
  attachedMovie.addEventHandler('update', () => {
    if (attachedMovie.currentFrame >= attachedMovie.totalFrames - 1) {
      attachedMovie = lwfInstance.rootMovie.attachMovie(
        scenes[increment],
        'battle',
        increment
      );

      updateScene(lwfInstance, attachedMovie, scenes, increment);
    }
  });
}
