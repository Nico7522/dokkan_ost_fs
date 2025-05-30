import { triggerNextScenes } from './helpers';

export function attachScenesForCard9523621ActiveSkill(
  lwfInstance: any,
  attachedMovie: any
) {
  attachedMovie.addEventHandler('update', () => {
    if (attachedMovie.currentFrame >= attachedMovie.totalFrames - 1) {
      let { attachedMovieBase } = triggerNextScenes(
        attachedMovie,
        lwfInstance,
        ['ef_002']
      );
      attachedMovie = attachedMovieBase;
      attachedMovie.addEventHandler('update', () => {
        if (attachedMovie.currentFrame >= attachedMovie.totalFrames - 1) {
          let { attachedMovie2 } = triggerNextScenes(
            attachedMovie,
            lwfInstance,
            ['ef_003_back', 'ef_003_front']
          );
          attachedMovie = attachedMovie2;

          attachedMovie.addEventHandler('update', () => {
            if (attachedMovie.currentFrame >= attachedMovie.totalFrames - 1) {
              let attachedMovie = lwfInstance.rootMovie.attachMovie(
                'ef_001_back',
                'battle',
                1
              );
              let attachedMovie2 = lwfInstance.rootMovie.attachMovie(
                'ef_001_front',
                'battle2',
                1
              );
              attachScenesForCard9523621ActiveSkill(lwfInstance, attachedMovie);
              if (attachedMovie) {
                attachedMovie.moveTo(
                  lwfInstance.width / 2,
                  lwfInstance.height / 2
                );
              }
              if (attachedMovie2) {
                attachedMovie2.moveTo(
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
}

export function attachScenesForCard9517161ActiveSkill(
  lwfInstance: any,
  attachedMovie: any
) {
  attachedMovie.addEventHandler('update', () => {
    if (attachedMovie.currentFrame >= attachedMovie.totalFrames - 1) {
      let { attachedMovieBase } = triggerNextScenes(
        attachedMovie,
        lwfInstance,
        ['ef_002']
      );
      attachedMovie = attachedMovieBase;

      attachedMovie.addEventHandler('update', () => {
        if (attachedMovie.currentFrame >= attachedMovie.totalFrames - 1) {
          let { attachedMovieBase } = triggerNextScenes(
            attachedMovie,
            lwfInstance,
            ['ef_003']
          );
          attachedMovie = attachedMovieBase;

          attachedMovie.addEventHandler('update', () => {
            if (attachedMovie.currentFrame >= attachedMovie.totalFrames - 1) {
              let { attachedMovieBase, attachedMovie2 } = triggerNextScenes(
                attachedMovie,
                lwfInstance,
                ['ef_005', 'ef_004']
              );
              attachedMovie = attachedMovieBase;

              attachedMovie2.addEventHandler('update', () => {
                if (
                  attachedMovie2.currentFrame >=
                  attachedMovie2.totalFrames - 1
                ) {
                  let { attachedMovieBase } = triggerNextScenes(
                    attachedMovie,
                    lwfInstance,
                    ['ef_006']
                  );
                  attachedMovie = attachedMovieBase;

                  attachedMovie.addEventHandler('update', () => {
                    if (
                      attachedMovie.currentFrame >=
                      attachedMovie.totalFrames - 1
                    ) {
                      let { attachedMovieBase } = triggerNextScenes(
                        attachedMovie,
                        lwfInstance,
                        ['ef_001']
                      );
                      attachedMovie = attachedMovieBase;
                      attachScenesForCard9517161ActiveSkill(
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

export function attachScenesForCard9514221ActiveSkill(
  lwfInstance: any,
  attachedMovie: any
) {
  attachedMovie.addEventHandler('update', () => {
    if (attachedMovie.currentFrame >= attachedMovie.totalFrames - 1) {
      let { attachedMovie2 } = triggerNextScenes(attachedMovie, lwfInstance, [
        'ef_003',
        'ef_002',
      ]);
      attachedMovie2.addEventHandler('update', () => {
        if (attachedMovie2.currentFrame >= attachedMovie2.totalFrames - 1) {
          attachedMovie2.removeMovieClip();
          let { attachedMovieBase } = triggerNextScenes(
            attachedMovie,
            lwfInstance,
            ['ef_004']
          );
          attachedMovie = attachedMovieBase;

          attachedMovie.addEventHandler('update', () => {
            if (attachedMovie.currentFrame >= attachedMovie.totalFrames - 1) {
              let { attachedMovieBase } = triggerNextScenes(
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
      let { attachedMovie2 } = triggerNextScenes(attachedMovie, lwfInstance, [
        'ef_003',
        'ef_002',
      ]);

      attachedMovie2.addEventHandler('update', () => {
        if (attachedMovie2.currentFrame >= attachedMovie2.totalFrames - 50) {
          attachedMovie2.removeMovieClip();

          let { attachedMovieBase } = triggerNextScenes(
            attachedMovie,
            lwfInstance,
            ['ef_004']
          );
          attachedMovie = attachedMovieBase;
          attachedMovie.addEventHandler('update', () => {
            if (attachedMovie.currentFrame >= attachedMovie.totalFrames - 50) {
              let { attachedMovie3 } = triggerNextScenes(
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

                  let { attachedMovieBase } = triggerNextScenes(
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
                      let { attachedMovieBase } = triggerNextScenes(
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
                          let { attachedMovieBase } = triggerNextScenes(
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

export function attachScenesForCard9517911ActiveSkill(
  lwfInstance: any,
  attachedMovie: any
) {
  attachedMovie.addEventHandler('update', () => {
    if (attachedMovie.currentFrame >= attachedMovie.totalFrames - 244) {
      let { attachedMovieBase } = triggerNextScenes(
        attachedMovie,
        lwfInstance,
        ['ef_002']
      );
      attachedMovie = attachedMovieBase;
      attachedMovie.addEventHandler('update', () => {
        if (attachedMovie.currentFrame >= attachedMovie.totalFrames - 1) {
          let { attachedMovieBase } = triggerNextScenes(
            attachedMovie,
            lwfInstance,
            ['ef_001']
          );
          attachedMovie = attachedMovieBase;
          attachScenesForCard9517911ActiveSkill(lwfInstance, attachedMovie);
        }
      });
    }
  });
}

export function attachScenesForCard1024141ActiveSkill(
  lwfInstance: any,
  attachedMovie: any
) {
  attachedMovie.addEventHandler('update', () => {
    if (attachedMovie.currentFrame >= attachedMovie.totalFrames - 1) {
      let { attachedMovie2 } = triggerNextScenes(attachedMovie, lwfInstance, [
        'ef_002_back',
        'ef_002_front',
      ]);
      attachedMovie = attachedMovie2;
      attachedMovie.addEventHandler('update', () => {
        if (attachedMovie.currentFrame >= attachedMovie.totalFrames - 1) {
          attachedMovie2.removeMovieClip();
          let { attachedMovieBase } = triggerNextScenes(
            attachedMovie,
            lwfInstance,
            ['ef_003_back', 'ef_003_front']
          );
          attachedMovie = attachedMovieBase;
          attachedMovie.addEventHandler('update', () => {
            if (attachedMovie.currentFrame >= attachedMovie.totalFrames - 1) {
              let { attachedMovieBase } = triggerNextScenes(
                attachedMovie,
                lwfInstance,
                ['ef_004_back', 'ef_004_front']
              );
              attachedMovie = attachedMovieBase;
              attachedMovie.addEventHandler('update', () => {
                if (
                  attachedMovie.currentFrame >=
                  attachedMovie.totalFrames - 1
                ) {
                  let { attachedMovieBase } = triggerNextScenes(
                    attachedMovie,
                    lwfInstance,
                    ['ef_005_back', 'ef_005_front']
                  );
                  attachedMovie = attachedMovieBase;
                  attachedMovie.addEventHandler('update', () => {
                    if (
                      attachedMovie.currentFrame >=
                      attachedMovie.totalFrames - 1
                    ) {
                      attachedMovie = lwfInstance.rootMovie.attachMovie(
                        'ef_001_back',
                        'battle',
                        1
                      );
                      attachScenesForCard1024141ActiveSkill(
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
        }
      });
    }
  });
}

export function attachScenesForCard1025071ActiveSkill(
  lwfInstance: any,
  attachedMovie: any
) {
  attachedMovie.addEventHandler('update', () => {
    if (attachedMovie.currentFrame >= attachedMovie.totalFrames - 1) {
      let { attachedMovie2 } = triggerNextScenes(attachedMovie, lwfInstance, [
        'ef_003',
        'ef_002',
      ]);
      attachedMovie = attachedMovie2;
      attachedMovie.addEventHandler('update', () => {
        if (attachedMovie.currentFrame >= attachedMovie.totalFrames - 1) {
          attachedMovie2.removeMovieClip();
          let { attachedMovieBase } = triggerNextScenes(
            attachedMovie,
            lwfInstance,
            ['ef_004']
          );
          attachedMovie = attachedMovieBase;
          attachedMovie.addEventHandler('update', () => {
            if (attachedMovie.currentFrame >= attachedMovie.totalFrames - 1) {
              attachedMovie = lwfInstance.rootMovie.attachMovie(
                'ef_001',
                'battle',
                1
              );
              attachScenesForCard1025071ActiveSkill(lwfInstance, attachedMovie);
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
}

export function attachScenesForCard4024901ActiveSkill(
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
            'ef_001',
            'battle',
            1
          );
          if (attachedMovie) {
            attachedMovie.moveTo(lwfInstance.width / 2, lwfInstance.height / 2);
          }
          let attachedMovie2 = lwfInstance.rootMovie.attachMovie(
            'ef_001_eff',
            'battle2',
            1
          );
          if (attachedMovie2) {
            attachedMovie2.moveTo(
              lwfInstance.width / 2,
              lwfInstance.height / 2
            );
          }
          attachScenesForCard4024901ActiveSkill(lwfInstance, attachedMovie);
        }
      });
    }
  });
}

export function attachScenesForCard9517981ActiveSkill(
  lwfInstance: any,
  attachedMovie: any
) {
  attachedMovie.addEventHandler('update', () => {
    if (attachedMovie.currentFrame >= attachedMovie.totalFrames - 60) {
      let { attachedMovieBase } = triggerNextScenes(
        attachedMovie,
        lwfInstance,
        ['ef_002', 'ef_003']
      );
      attachedMovie = attachedMovieBase;
      attachedMovie.addEventHandler('update', () => {
        if (attachedMovie.currentFrame >= attachedMovie.totalFrames - 200) {
          let { attachedMovieBase } = triggerNextScenes(
            attachedMovie,
            lwfInstance,
            ['ef_004']
          );
          attachedMovie = attachedMovieBase;
          attachedMovie.addEventHandler('update', () => {
            if (attachedMovie.currentFrame >= attachedMovie.totalFrames - 1) {
              attachedMovie = lwfInstance.rootMovie.attachMovie(
                'ef_001',
                'battle',
                1
              );
              attachScenesForCard9517981ActiveSkill(lwfInstance, attachedMovie);
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
}

export function attachScenesForCard1025631ActiveSkill(
  lwfInstance: any,
  attachedMovie: any
) {
  attachedMovie.addEventHandler('update', () => {
    if (attachedMovie.currentFrame >= attachedMovie.totalFrames - 1) {
      let { attachedMovieBase } = triggerNextScenes(
        attachedMovie,
        lwfInstance,
        ['ef_002', 'ef_003']
      );
      attachedMovie = attachedMovieBase;
      attachedMovie.addEventHandler('update', () => {
        if (attachedMovie.currentFrame >= attachedMovie.totalFrames - 1) {
          let attachedMovie = lwfInstance.rootMovie.attachMovie(
            'ef_001',
            'battle',
            1
          );
          attachScenesForCard1025631ActiveSkill(lwfInstance, attachedMovie);
          if (attachedMovie) {
            attachedMovie.moveTo(lwfInstance.width / 2, lwfInstance.height / 2);
          }
        }
      });
    }
  });
}

export function attachScenesForCard9520311ActiveSkill(
  lwfInstance: any,
  attachedMovie: any
) {
  attachedMovie.addEventHandler('update', () => {
    if (attachedMovie.currentFrame >= attachedMovie.totalFrames - 1) {
      let { attachedMovieBase } = triggerNextScenes(
        attachedMovie,
        lwfInstance,
        ['ef_003', 'ef_002']
      );
      attachedMovie = attachedMovieBase;
      attachedMovie.addEventHandler('update', () => {
        if (attachedMovie.currentFrame >= attachedMovie.totalFrames - 1) {
          attachedMovie = lwfInstance.rootMovie.attachMovie(
            'ef_001',
            'battle',
            1
          );
          attachScenesForCard9520311ActiveSkill(lwfInstance, attachedMovie);
          if (attachedMovie) {
            attachedMovie.moveTo(lwfInstance.width / 2, lwfInstance.height / 2);
          }
        }
      });
    }
  });
}

export function attachScenesForCard1026901StandbySkill(lwfInstance: any) {
  let attachedMovie2 = lwfInstance.rootMovie.attachMovie(
    'ef_001',
    'battle2',
    1
  );
  if (attachedMovie2) {
    attachedMovie2.moveTo(lwfInstance.width / 2, lwfInstance.height / 2);
  }
}

export function attachScenesForCard4025741FinishSkill(
  lwfInstance: any,
  attachedMovie: any,
  timeToCut: number
) {
  attachedMovie.addEventHandler('update', () => {
    if (attachedMovie.currentFrame >= attachedMovie.totalFrames - timeToCut) {
      let { attachedMovieBase } = triggerNextScenes(
        attachedMovie,
        lwfInstance,
        ['ef_002']
      );
      attachedMovie = attachedMovieBase;
      attachedMovie.addEventHandler('update', () => {
        if (attachedMovie.currentFrame >= attachedMovie.totalFrames - 40) {
          let { attachedMovieBase, attachedMovie2 } = triggerNextScenes(
            attachedMovie,
            lwfInstance,
            ['ef_003', 'ef_004']
          );
          attachedMovie = attachedMovie2;
          attachedMovie.addEventHandler('update', () => {
            if (attachedMovie.currentFrame >= attachedMovie.totalFrames - 1) {
              attachedMovie2.removeMovieClip();
              attachedMovie = lwfInstance.rootMovie.attachMovie(
                'ef_001',
                'battle',
                1
              );
              attachScenesForCard4025741FinishSkill(
                lwfInstance,
                attachedMovie,
                timeToCut
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
}

export function attachScenesForCard4026541FinishSkill(lwfInstance: any) {
  let attachedMovie = lwfInstance.rootMovie.attachMovie('ef_001b', 'battle', 1);
  let attachedMovie2 = lwfInstance.rootMovie.attachMovie(
    'ef_001',
    'battle2',
    1
  );

  if (attachedMovie) {
    attachedMovie.moveTo(lwfInstance.width / 2, lwfInstance.height / 2);
  }
  if (attachedMovie2) {
    attachedMovie2.moveTo(lwfInstance.width / 2, lwfInstance.height / 2);
  }
}

export function attachScenesForCard9526401FinishSkill(
  lwfInstance: any,
  attachedMovie: any
) {
  attachedMovie.addEventHandler('update', () => {
    if (attachedMovie.currentFrame >= attachedMovie.totalFrames - 1) {
      let { attachedMovieBase } = triggerNextScenes(
        attachedMovie,
        lwfInstance,
        ['ef_002']
      );
      attachedMovie = attachedMovieBase;
      attachedMovie.addEventHandler('update', () => {
        if (attachedMovie.currentFrame >= attachedMovie.totalFrames - 1) {
          let { attachedMovieBase } = triggerNextScenes(
            attachedMovie,
            lwfInstance,
            ['ef_003']
          );
          attachedMovie = attachedMovieBase;
          attachedMovie.addEventHandler('update', () => {
            if (attachedMovie.currentFrame >= attachedMovie.totalFrames - 1) {
              let { attachedMovieBase, attachedMovie2 } = triggerNextScenes(
                attachedMovie,
                lwfInstance,
                ['ef_004_back', 'ef_004']
              );
              attachedMovie = attachedMovieBase;

              attachedMovie.addEventHandler('update', () => {
                if (
                  attachedMovie.currentFrame >=
                  attachedMovie.totalFrames - 1
                ) {
                  attachedMovie = lwfInstance.rootMovie.attachMovie(
                    'ef_001',
                    'battle',
                    1
                  );
                  attachScenesForCard9526401FinishSkill(
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
    }
  });
}

export function attachScenesForCard40304511ActiveSkill(
  lwfInstance: any,
  attachedMovie: any
) {
  attachedMovie.addEventHandler('update', () => {
    if (attachedMovie.currentFrame >= attachedMovie.totalFrames - 1) {
      let { attachedMovieBase } = triggerNextScenes(
        attachedMovie,
        lwfInstance,
        ['ef_002']
      );
      attachedMovie = attachedMovieBase;
      attachedMovie.addEventHandler('update', () => {
        if (attachedMovie.currentFrame >= attachedMovie.totalFrames - 1) {
          let attachedMovie = lwfInstance.rootMovie.attachMovie(
            'ef_001_b',
            'battle',
            1
          );
          let attachedMovie2 = lwfInstance.rootMovie.attachMovie(
            'ef_001',
            'battle2',
            1
          );
          if (attachedMovie) {
            attachedMovie.moveTo(lwfInstance.width / 2, lwfInstance.height / 2);
          }

          if (attachedMovie2) {
            attachedMovie2.moveTo(
              lwfInstance.width / 2,
              lwfInstance.height / 2
            );
          }
          attachScenesForCard40304511ActiveSkill(lwfInstance, attachedMovie);
        }
      });
    }
  });
}

export function attachScenesForCard1022091ActiveSkill(
  lwfInstance: any,
  attachedMovie: any
) {
  attachedMovie.addEventHandler('update', () => {
    if (attachedMovie.currentFrame >= attachedMovie.totalFrames - 1) {
      let { attachedMovieBase } = triggerNextScenes(
        attachedMovie,
        lwfInstance,
        ['ef_003']
      );
      attachedMovie = attachedMovieBase;

      attachedMovie.addEventHandler('update', () => {
        if (attachedMovie.currentFrame >= attachedMovie.totalFrames - 1) {
          let { attachedMovieBase } = triggerNextScenes(
            attachedMovie,
            lwfInstance,
            ['ef_004']
          );
          attachedMovie = attachedMovieBase;

          attachedMovie.addEventHandler('update', () => {
            if (attachedMovie.currentFrame >= attachedMovie.totalFrames - 1) {
              let attachedMovie2 = lwfInstance.rootMovie.attachMovie(
                'ef_002',
                'battle2',
                1
              );

              let attachedMovie = lwfInstance.rootMovie.attachMovie(
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
              if (attachedMovie2) {
                attachedMovie2.moveTo(
                  lwfInstance.width / 2,
                  lwfInstance.height / 2
                );
              }

              attachScenesForCard1022091ActiveSkill(lwfInstance, attachedMovie);
            }
          });
        }
      });
    }
  });
}
