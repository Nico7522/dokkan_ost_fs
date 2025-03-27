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

export function startGokuKaiokenActiveSkill(lwfInstance: any) {
  let attachedMovieBase = lwfInstance.rootMovie.attachMovie(
    'ef_001_front',
    'a',
    0
  );

  let scenes = lwfInstance.rootMovie.attachMovie('ef_001_back', 'b', 0);
  if (attachedMovieBase) {
    attachedMovieBase.moveTo(lwfInstance.width / 2, lwfInstance.height / 2);
  }
  if (scenes) {
    scenes.moveTo(lwfInstance.width / 2, lwfInstance.height / 2);
  }
  return scenes;
}
