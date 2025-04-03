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

export function attachScenesForCard9514221ActiveSkill(
  lwfInstance: any,
  attachedMovie: any
) {
  attachedMovie.addEventHandler('update', () => {
    if (attachedMovie.currentFrame >= attachedMovie.totalFrames - 1) {
      attachedMovie = lwfInstance.rootMovie.attachMovie('ef_003', 'battle', 1);
      if (attachedMovie) {
        attachedMovie.moveTo(lwfInstance.width / 2, lwfInstance.height / 2);
      }
      let attachedMovie2 = lwfInstance.rootMovie.attachMovie(
        'ef_002',
        'battle2',
        1
      );
      if (attachedMovie2) {
        attachedMovie2.moveTo(lwfInstance.width / 2, lwfInstance.height / 2);
      }

      attachedMovie2.addEventHandler('update', () => {
        if (attachedMovie2.currentFrame >= attachedMovie2.totalFrames - 1) {
          attachedMovie2.removeMovieClip();
          attachedMovie = lwfInstance.rootMovie.attachMovie(
            'ef_004',
            'battle',
            1
          );
          if (attachedMovie) {
            attachedMovie.moveTo(lwfInstance.width / 2, lwfInstance.height / 2);
          }

          attachedMovie.addEventHandler('update', () => {
            if (attachedMovie.currentFrame >= attachedMovie.totalFrames - 1) {
              attachedMovie = lwfInstance.rootMovie.attachMovie(
                'ef_001',
                'battle',
                1
              );
              if (attachedMovie) {
                attachedMovie.moveTo(
                  lwfInstance.width / 2,
                  lwfInstance.height / 2
                );
              }
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
      attachedMovie = lwfInstance.rootMovie.attachMovie('ef_003', 'battle', 1);
      if (attachedMovie) {
        attachedMovie.moveTo(lwfInstance.width / 2, lwfInstance.height / 2);
      }
      let attachedMovie2 = lwfInstance.rootMovie.attachMovie(
        'ef_002',
        'battle2',
        1
      );
      if (attachedMovie2) {
        attachedMovie2.moveTo(lwfInstance.width / 2, lwfInstance.height / 2);
      }

      attachedMovie2.addEventHandler('update', () => {
        if (attachedMovie2.currentFrame >= attachedMovie2.totalFrames - 50) {
          attachedMovie2.removeMovieClip();

          attachedMovie = lwfInstance.rootMovie.attachMovie(
            'ef_004',
            'battle',
            1
          );
          if (attachedMovie) {
            attachedMovie.moveTo(lwfInstance.width / 2, lwfInstance.height / 2);
          }
          attachedMovie.addEventHandler('update', () => {
            if (attachedMovie.currentFrame >= attachedMovie.totalFrames - 50) {
              attachedMovie = lwfInstance.rootMovie.attachMovie(
                'ef_009',
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
                'ef_006',
                'battl2',
                1
              );
              if (attachedMovie2) {
                attachedMovie2.moveTo(
                  lwfInstance.width / 2,
                  lwfInstance.height / 2
                );
              }
              let attachedMovie3 = lwfInstance.rootMovie.attachMovie(
                'ef_005',
                'battl3',
                1
              );
              if (attachedMovie3) {
                attachedMovie3.moveTo(
                  lwfInstance.width / 2,
                  lwfInstance.height / 2
                );
              }
              attachedMovie3.addEventHandler('update', () => {
                if (
                  attachedMovie3.currentFrame >=
                  attachedMovie3.totalFrames - 50
                ) {
                  attachedMovie2.removeMovieClip();
                  attachedMovie3.removeMovieClip();
                  attachedMovie = lwfInstance.rootMovie.attachMovie(
                    'ef_008',
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
                      attachedMovie = lwfInstance.rootMovie.attachMovie(
                        'ef_007',
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
                          attachedMovie.totalFrames - 50
                        ) {
                          attachedMovie = lwfInstance.rootMovie.attachMovie(
                            'ef_001',
                            'battle',
                            1
                          );
                          attachScenesForCard1016571ActiveSkill(
                            lwfInstance,
                            attachedMovie
                          );
                          if (attachedMovie) {
                            attachedMovie.moveTo(
                              lwfInstance.width / 2,
                              lwfInstance.height / 2
                            );
                          }
                        }
                      });
                    }
                  });
                }
              });
              // let attachedMovie3 = lwfInstance.rootMovie.attachMovie(
              //   'ef_006',
              //   'battle',
              //   1
              // );
              // if (attachedMovie3) {
              //   attachedMovie3.moveTo(
              //     lwfInstance.width / 2,
              //     lwfInstance.height / 2
              //   );
              // }
            }
          });
        }
      });
    }
  });
}
