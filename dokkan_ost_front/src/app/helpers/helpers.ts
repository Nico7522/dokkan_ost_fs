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

export function attachScenesForCard9523621ActiveSkill(lwfInstance: any) {
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

export function attachScenesForCard9517161ActiveSkill(
  lwfInstance: any,
  attachedMovie: any
) {
  attachedMovie.addEventHandler('update', () => {
    if (attachedMovie.currentFrame >= attachedMovie.totalFrames - 1) {
      attachedMovie = lwfInstance.rootMovie.attachMovie('ef_002', 'battle', 1);
      if (attachedMovie) {
        attachedMovie.moveTo(lwfInstance.width / 2, lwfInstance.height / 2);
      }
      attachedMovie.addEventHandler('update', () => {
        if (attachedMovie.currentFrame >= attachedMovie.totalFrames - 1) {
          attachedMovie = lwfInstance.rootMovie.attachMovie(
            'ef_003',
            'battle',
            1
          );
          if (attachedMovie) {
            attachedMovie.moveTo(lwfInstance.width / 2, lwfInstance.height / 2);
          }
          attachedMovie.addEventHandler('update', () => {
            if (attachedMovie.currentFrame >= attachedMovie.totalFrames - 1) {
              attachedMovie = lwfInstance.rootMovie.attachMovie(
                'ef_005',
                'battle',
                1
              );
              if (attachedMovie) {
                attachedMovie.moveTo(
                  lwfInstance.width / 2,
                  lwfInstance.height / 2
                );
              }
              let attachedMovie2 = lwfInstance.rootMovie.attachMovie(
                'ef_004',
                'battle2',
                1
              );
              if (attachedMovie2) {
                attachedMovie2.moveTo(
                  lwfInstance.width / 2,
                  lwfInstance.height / 2
                );
                attachedMovie2.addEventHandler('update', () => {
                  if (
                    attachedMovie2.currentFrame >=
                    attachedMovie2.totalFrames - 1
                  ) {
                    attachedMovie = lwfInstance.rootMovie.attachMovie(
                      'ef_006',
                      'battle',
                      1
                    );
                    if (attachedMovie) {
                      attachedMovie.moveTo(
                        lwfInstance.width / 2,
                        lwfInstance.height / 2
                      );
                    }
                    attachedMovie.addEventHandler('update', () => {
                      if (
                        attachedMovie.currentFrame >=
                        attachedMovie.totalFrames - 1
                      ) {
                        attachScenesForCard9517161ActiveSkill(
                          lwfInstance,
                          attachedMovie
                        );
                      }
                    });
                  }
                });
              }
            }
          });
        }
      });
    }
  });
}

export function triggerNextScene(
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
      // return attachedMovie;
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

export function attachScenesForCard9514221ActiveSkill(
  lwfInstance: any,
  attachedMovie: any
) {
  attachedMovie.addEventHandler('update', () => {
    if (attachedMovie.currentFrame >= attachedMovie.totalFrames - 1) {
      let { attachedMovie2 } = triggerNextScene(attachedMovie, lwfInstance, [
        'ef_003',
        'ef_002',
      ]);
      attachedMovie2.addEventHandler('update', () => {
        if (attachedMovie2.currentFrame >= attachedMovie2.totalFrames - 1) {
          attachedMovie2.removeMovieClip();
          let { attachedMovieBase } = triggerNextScene(
            attachedMovie,
            lwfInstance,
            ['ef_004']
          );
          attachedMovie = attachedMovieBase;

          attachedMovie.addEventHandler('update', () => {
            if (attachedMovie.currentFrame >= attachedMovie.totalFrames - 1) {
              let { attachedMovieBase } = triggerNextScene(
                attachedMovie,
                lwfInstance,
                ['ef_001']
              );
              attachedMovie = attachedMovieBase;

              attachScenesForCard9514221ActiveSkill(lwfInstance, attachedMovie);
            }
          });
        }
      });
    }
  });
}

export function attachScenesForCard1016571ActiveSkill(
  lwfInstance: any,
  attachedMovie: any
) {
  attachedMovie.addEventHandler('update', () => {
    if (attachedMovie.currentFrame >= attachedMovie.totalFrames - 270) {
      let { attachedMovie2 } = triggerNextScene(attachedMovie, lwfInstance, [
        'ef_003',
        'ef_002',
      ]);

      attachedMovie2.addEventHandler('update', () => {
        if (attachedMovie2.currentFrame >= attachedMovie2.totalFrames - 50) {
          attachedMovie2.removeMovieClip();

          let { attachedMovieBase } = triggerNextScene(
            attachedMovie,
            lwfInstance,
            ['ef_004']
          );
          attachedMovie = attachedMovieBase;
          attachedMovie.addEventHandler('update', () => {
            if (attachedMovie.currentFrame >= attachedMovie.totalFrames - 50) {
              let { attachedMovie3 } = triggerNextScene(
                attachedMovie,
                lwfInstance,
                ['ef_009', 'ef_006', 'ef_005']
              );
              attachedMovie3.addEventHandler('update', () => {
                if (
                  attachedMovie3.currentFrame >=
                  attachedMovie3.totalFrames - 50
                ) {
                  attachedMovie2.removeMovieClip();
                  attachedMovie3.removeMovieClip();

                  let { attachedMovieBase } = triggerNextScene(
                    attachedMovie,
                    lwfInstance,
                    ['ef_008']
                  );
                  attachedMovie = attachedMovieBase;
                  attachedMovie.addEventHandler('update', () => {
                    if (
                      attachedMovie.currentFrame >=
                      attachedMovie.totalFrames - 1
                    ) {
                      let { attachedMovieBase } = triggerNextScene(
                        attachedMovie,
                        lwfInstance,
                        ['ef_007']
                      );
                      attachedMovie = attachedMovieBase;

                      attachedMovie.addEventHandler('update', () => {
                        if (
                          attachedMovie.currentFrame >=
                          attachedMovie.totalFrames - 50
                        ) {
                          let { attachedMovieBase } = triggerNextScene(
                            attachedMovie,
                            lwfInstance,
                            ['ef_001']
                          );
                          attachedMovie = attachedMovieBase;
                          attachScenesForCard1016571ActiveSkill(
                            lwfInstance,
                            attachedMovie
                          );
                        }
                      });
                    }
                  });
                }
              });
            }
          });
        }
      });
    }
  });
}

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
