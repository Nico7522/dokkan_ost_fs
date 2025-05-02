import {
  sp_effect_a1_00144_scenes,
  sp_effect_a1_00364_scenes,
  sp_effect_a2_00174_scenes,
  sp_effect_a9_00094_scenes,
} from '../data/scenes';
import {
  attachScenesForCard1016571ActiveSkill,
  attachScenesForCard9514221ActiveSkill,
  attachScenesForCard9517161ActiveSkill,
  attachScenesForCard9517911ActiveSkill,
  attachScenesForCard9523621ActiveSkill,
  attachScenesForCard1024141ActiveSkill,
  attachScenesForCard1025071ActiveSkill,
  attachScenesForCard4024901ActiveSkill,
  attachScenesForCard9517981ActiveSkill,
  attachScenesForCard1025631ActiveSkill,
  attachScenesForCard9520311ActiveSkill,
  attachScenesForCard1026901StandbySkill,
  attachScenesForCard4025741FinishSkill,
  attachScenesForCard4026541FinishSkill,
  attachScenesForCard9526401FinishSkill,
} from './attach_scene';

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

export function isSpecialAnimationPlayed(
  lwfInstance: any,
  increment: number,
  lwfName: string,
  triggerScene?: string
): boolean {
  let isPlayed: boolean = false;
  switch (lwfName) {
    case 'sp_effect_a2_00174.lwf': {
      isPlayed = true;
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
        attachedMovie.moveTo(lwfInstance.width / 2, lwfInstance.height / 2);
      }
      if (attachedMovie2) {
        attachedMovie2.moveTo(lwfInstance.width / 2, lwfInstance.height / 2);
      }
      break;
    }

    case 'battle_301234.lwf': {
      isPlayed = true;
      let attachedMovie = lwfInstance.rootMovie.attachMovie(
        sp_effect_a1_00364_scenes[increment],
        'battle',
        1
      );

      updateScene(
        lwfInstance,
        attachedMovie,
        sp_effect_a1_00364_scenes,
        increment
      );
      if (attachedMovie) {
        attachedMovie.moveTo(lwfInstance.width / 2, lwfInstance.height / 2);
      }
      break;
    }
    case 'sp_effect_b4_00315.lwf': {
      isPlayed = true;
      let attachedMovieBase = lwfInstance.rootMovie.attachMovie(
        'ef_001',
        'battle',
        1
      );
      let attachedMovie2 = lwfInstance.rootMovie.attachMovie(
        'ef_001b',
        'battle2',
        1
      );
      if (attachedMovieBase) {
        attachedMovieBase.moveTo(lwfInstance.width / 2, lwfInstance.height / 2);
      }
      if (attachedMovie2) {
        attachedMovie2.moveTo(lwfInstance.width / 2, lwfInstance.height / 2);
      }
      break;
    }
    case 'sp_effect_a9_00094.lwf': {
      isPlayed = true;
      let attachedMovie = lwfInstance.rootMovie.attachMovie(
        sp_effect_a9_00094_scenes[increment],
        'battle',
        1
      );
      updateScene(
        lwfInstance,
        attachedMovie,
        sp_effect_a9_00094_scenes,
        increment
      );

      if (attachedMovie) {
        attachedMovie.moveTo(lwfInstance.width / 2, lwfInstance.height / 2);
      }
      break;
    }
    case 'sp_effect_a1_00144.lwf': {
      isPlayed = true;

      let attachedMovie = lwfInstance.rootMovie.attachMovie(
        sp_effect_a1_00144_scenes[increment],
        'a',
        1
      );
      updateScene(
        lwfInstance,
        attachedMovie,
        sp_effect_a1_00144_scenes,
        increment
      );
      if (attachedMovie) {
        attachedMovie.moveTo(lwfInstance.width / 2, lwfInstance.height / 2);
      }
      break;
    }
    case 'sp_effect_a2_00114.lwf': {
      isPlayed = true;

      let attachedMovie = lwfInstance.rootMovie.attachMovie(
        'ef_001',
        'battle',
        1
      );
      if (attachedMovie) {
        attachedMovie.moveTo(lwfInstance.width / 2, lwfInstance.height / 2);
      }

      attachScenesForCard9517161ActiveSkill(lwfInstance, attachedMovie);
      break;
    }
    case 'sp_effect_a2_00100.lwf': {
      isPlayed = true;

      let attachedMovie = lwfInstance.rootMovie.attachMovie(
        'ef_007',
        'battle',
        1
      );
      if (attachedMovie) {
        attachedMovie.moveTo(lwfInstance.width / 2, lwfInstance.height / 2);
      }
      break;
    }
    case 'sp_effect_a1_00143.lwf': {
      isPlayed = true;

      let attachedMovie = lwfInstance.rootMovie.attachMovie(
        'ef_001',
        'battle',
        1
      );
      attachScenesForCard9514221ActiveSkill(lwfInstance, attachedMovie);

      if (attachedMovie) {
        attachedMovie.moveTo(lwfInstance.width / 2, lwfInstance.height / 2);
      }
      break;
    }
    case 'sp_effect_b4_00086.lwf': {
      isPlayed = true;

      let attachedMovie = lwfInstance.rootMovie.attachMovie(
        'ef_001',
        'battle',
        1
      );

      attachScenesForCard1016571ActiveSkill(lwfInstance, attachedMovie);
      if (attachedMovie) {
        attachedMovie.moveTo(lwfInstance.width / 2, lwfInstance.height / 2);
      }
      break;
    }
    case 'battle_301206.lwf': {
      isPlayed = true;

      let attachedMovie = lwfInstance.rootMovie.attachMovie(
        'ef_001',
        'battle',
        1
      );
      forceReplay(lwfInstance, attachedMovie, 'ef_001');
      if (attachedMovie) {
        attachedMovie.moveTo(lwfInstance.width / 2, lwfInstance.height / 2);
      }
      break;
    }
    case 'battle_301215.lwf': {
      isPlayed = true;

      let attachedMovie = lwfInstance.rootMovie.attachMovie(
        'ef_001',
        'battle',
        1
      );
      forceReplay(lwfInstance, attachedMovie, 'ef_001');
      if (attachedMovie) {
        attachedMovie.moveTo(lwfInstance.width / 2, lwfInstance.height / 2);
      }
      break;
    }
    case 'battle_301222.lwf': {
      isPlayed = true;

      let attachedMovie = lwfInstance.rootMovie.attachMovie(
        'ef_001',
        'battle',
        1
      );
      forceReplay(lwfInstance, attachedMovie, 'ef_001');
      if (attachedMovie) {
        attachedMovie.moveTo(lwfInstance.width / 2, lwfInstance.height / 2);
      }
      break;
    }
    case 'sp_effect_a1_00175.lwf': {
      isPlayed = true;

      let attachedMovie = lwfInstance.rootMovie.attachMovie(
        'ef_001',
        'battle',
        1
      );
      attachScenesForCard9517911ActiveSkill(lwfInstance, attachedMovie);
      if (attachedMovie) {
        attachedMovie.moveTo(lwfInstance.width / 2, lwfInstance.height / 2);
      }
      break;
    }
    case 'sp_effect_b4_00189.lwf': {
      isPlayed = true;

      let attachedMovie2 = lwfInstance.rootMovie.attachMovie(
        'ef_002',
        'battle2',
        1
      );

      if (attachedMovie2) {
        attachedMovie2.moveTo(lwfInstance.width / 2, lwfInstance.height / 2);
      }
      let attachedMovie = lwfInstance.rootMovie.attachMovie(
        'ef_001',
        'battle',
        1
      );

      if (attachedMovie) {
        attachedMovie.moveTo(lwfInstance.width / 2, lwfInstance.height / 2);
      }
      break;
    }
    case 'sp_effect_b4_00201.lwf': {
      isPlayed = true;

      let attachedMovie = lwfInstance.rootMovie.attachMovie(
        'ef_001',
        'battle',
        1
      );
      if (attachedMovie) {
        attachedMovie.moveTo(lwfInstance.width / 2, lwfInstance.height / 2);
      }

      updateScene(lwfInstance, attachedMovie, ['ef_001', 'ef_002'], increment);
      break;
    }
    case 'sp_effect_a7_00052.lwf': {
      isPlayed = true;

      let attachedMovie = lwfInstance.rootMovie.attachMovie(
        'ef_001',
        'battle',
        1
      );
      if (attachedMovie) {
        attachedMovie.moveTo(lwfInstance.width / 2, lwfInstance.height / 2);
      }

      updateScene(
        lwfInstance,
        attachedMovie,
        ['ef_001', 'ef_002', 'ef_003'],
        increment
      );
      break;
    }
    case 'sp_effect_a3_00090.lwf': {
      isPlayed = true;

      let attachedMovie = lwfInstance.rootMovie.attachMovie(
        'ef_001_back',
        'battle',
        1
      );
      if (attachedMovie) {
        attachedMovie.moveTo(lwfInstance.width / 2, lwfInstance.height / 2);
      }
      attachScenesForCard1024141ActiveSkill(lwfInstance, attachedMovie);
      break;
    }
    case 'sp_effect_b4_00240.lwf': {
      isPlayed = true;

      let attachedMovie = lwfInstance.rootMovie.attachMovie(
        'ef_002',
        'battle2',
        1
      );
      if (attachedMovie) {
        attachedMovie.moveTo(lwfInstance.width / 2, lwfInstance.height / 2);
      }
      break;
    }
    case 'sp_effect_a1_00366.lwf': {
      isPlayed = true;

      let attachedMovie2 = lwfInstance.rootMovie.attachMovie(
        'ef_001_b',
        'battle2',
        1
      );
      if (attachedMovie2) {
        attachedMovie2.moveTo(lwfInstance.width / 2, lwfInstance.height / 2);
      }
      let attachedMovie = lwfInstance.rootMovie.attachMovie(
        'ef_001',
        'battle',
        1
      );
      if (attachedMovie) {
        attachedMovie.moveTo(lwfInstance.width / 2, lwfInstance.height / 2);
      }
      break;
    }
    case 'sp_effect_a2_00187.lwf': {
      isPlayed = true;
      let attachedMovie = lwfInstance.rootMovie.attachMovie(
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
        attachedMovie2.moveTo(lwfInstance.width / 2, lwfInstance.height / 2);
      }
      attachScenesForCard4024901ActiveSkill(lwfInstance, attachedMovie);

      break;
    }
    case 'sp_effect_b4_00253.lwf': {
      isPlayed = true;

      let attachedMovie = lwfInstance.rootMovie.attachMovie(
        'ef_001',
        'battle',
        1
      );
      updateScene(
        lwfInstance,
        attachedMovie,
        [
          'ef_001',
          'ef_002',
          'ef_003',
          'ef_004',
          'ef_005',
          // 'ef_006',
          'ef_006_b',
          'ef_007',
        ],
        increment
      );
      if (attachedMovie) {
        attachedMovie.moveTo(lwfInstance.width / 2, lwfInstance.height / 2);
      }
      console.log(lwfInstance);
      break;
    }
    case 'sp_effect_a1_00372.lwf': {
      isPlayed = true;

      let attachedMovie = lwfInstance.rootMovie.attachMovie(
        'ef_001',
        'battle',
        1
      );
      if (attachedMovie) {
        attachedMovie.moveTo(lwfInstance.width / 2, lwfInstance.height / 2);
      }
      attachScenesForCard1025071ActiveSkill(lwfInstance, attachedMovie);
      break;
    }
    case 'battle_301244.lwf': {
      isPlayed = true;
      console.log(lwfInstance);
      let attachedMovie = lwfInstance.rootMovie.attachMovie(
        'ef_001',
        'battle',
        1
      );
      if (attachedMovie) {
        attachedMovie.moveTo(lwfInstance.width / 2, lwfInstance.height / 2);
      }
      forceReplay(lwfInstance, attachedMovie, 'ef_001');
      break;
    }
    case 'sp_effect_b4_00135.lwf': {
      isPlayed = true;
      let attachedMovie = lwfInstance.rootMovie.attachMovie(
        'ef_001',
        'battle',
        1
      );

      updateScene(
        lwfInstance,
        attachedMovie,
        ['ef_001', 'ef_002', 'ef_003'],
        0
      );
      if (attachedMovie) {
        attachedMovie.moveTo(lwfInstance.width / 2, lwfInstance.height / 2);
      }
      break;
    }

    case 'sp_effect_a2_00124.lwf': {
      isPlayed = true;
      let attachedMovie = lwfInstance.rootMovie.attachMovie(
        'ef_001',
        'battle',
        1
      );

      updateScene(
        lwfInstance,
        attachedMovie,
        [
          'ef_001',
          'ef_002',
          'ef_003',
          'ef_004',
          'ef_005',
          'ef_006_a',
          'ef_006_b',
          'ef_007',
          'ef_008_a',
          'ef_008_b',
          'ef_009',
          'ef_0010',
        ],
        0
      );
      if (attachedMovie) {
        attachedMovie.moveTo(lwfInstance.width / 2, lwfInstance.height / 2);
      }
      break;
    }

    case 'sp_effect_b4_00207.lwf': {
      isPlayed = true;
      let attachedMovie = lwfInstance.rootMovie.attachMovie(
        'ef_001',
        'battle',
        1
      );
      updateScene(lwfInstance, attachedMovie, ['ef_001', 'ef_002'], 0);
      if (attachedMovie) {
        attachedMovie.moveTo(lwfInstance.width / 2, lwfInstance.height / 2);
      }
      break;
    }
    case 'sp_effect_b4_00155.lwf': {
      console.log(lwfInstance);
      isPlayed = true;
      let attachedMovie = lwfInstance.rootMovie.attachMovie(
        'ef_001',
        'battle',
        1
      );
      updateScene(
        lwfInstance,
        attachedMovie,
        ['ef_001', 'ef_002', 'ef_003', 'ef_004', 'ef_005'],
        0
      );
      if (attachedMovie) {
        attachedMovie.moveTo(lwfInstance.width / 2, lwfInstance.height / 2);
      }
      break;
    }

    case 'sp_effect_a1_00213.lwf': {
      isPlayed = true;
      let attachedMovie = lwfInstance.rootMovie.attachMovie(
        'ef_001',
        'battle',
        1
      );
      attachScenesForCard9517981ActiveSkill(lwfInstance, attachedMovie);
      if (attachedMovie) {
        attachedMovie.moveTo(lwfInstance.width / 2, lwfInstance.height / 2);
      }

      break;
    }

    case 'sp_effect_a2_00173.lwf': {
      isPlayed = true;
      let attachedMovie = lwfInstance.rootMovie.attachMovie(
        'ef_001',
        'battle',
        1
      );
      updateScene(
        lwfInstance,
        attachedMovie,
        ['ef_001', 'ef_002', 'ef_003'],
        0
      );
      if (attachedMovie) {
        attachedMovie.moveTo(lwfInstance.width / 2, lwfInstance.height / 2);
      }

      break;
    }

    case 'sp_effect_a1_00384.lwf': {
      isPlayed = true;
      let attachedMovie = lwfInstance.rootMovie.attachMovie(
        'ef_001',
        'battle',
        1
      );
      attachScenesForCard1025631ActiveSkill(lwfInstance, attachedMovie);
      if (attachedMovie) {
        attachedMovie.moveTo(lwfInstance.width / 2, lwfInstance.height / 2);
      }

      break;
    }

    case 'sp_effect_b1_00131.lwf': {
      isPlayed = true;
      let attachedMovie = lwfInstance.rootMovie.attachMovie(
        'ef_001',
        'battle',
        1
      );

      attachScenesForCard9520311ActiveSkill(lwfInstance, attachedMovie);
      if (attachedMovie) {
        attachedMovie.moveTo(lwfInstance.width / 2, lwfInstance.height / 2);
      }

      break;
    }

    case 'sp_effect_b4_00293.lwf': {
      isPlayed = true;
      let attachedMovie = lwfInstance.rootMovie.attachMovie(
        'ef_001b',
        'battle',
        1
      );

      attachScenesForCard1026901StandbySkill(lwfInstance);
      if (attachedMovie) {
        attachedMovie.moveTo(lwfInstance.width / 2, lwfInstance.height / 2);
      }
      break;
    }

    case 'sp_effect_a1_00487.lwf': {
      console.log(lwfInstance);

      isPlayed = true;
      let attachedMovie = lwfInstance.rootMovie.attachMovie(
        'ef_001_b',
        'battle',
        1
      );
      if (attachedMovie) {
        attachedMovie.moveTo(lwfInstance.width / 2, lwfInstance.height / 2);
      }

      let attachedMovie2 = lwfInstance.rootMovie.attachMovie(
        'ef_001',
        'battle2',
        1
      );
      if (attachedMovie2) {
        attachedMovie2.moveTo(lwfInstance.width / 2, lwfInstance.height / 2);
      }

      let attachedMovie3 = lwfInstance.rootMovie.attachMovie(
        'ef_001_r',
        'battle3',
        1
      );
      if (attachedMovie3) {
        attachedMovie3.moveTo(lwfInstance.width / 2, lwfInstance.height / 2);
      }
      updateScene(lwfInstance, attachedMovie, ['ef_001', 'ef_002'], 0);
      break;
    }

    case 'sp_effect_b1_00289.lwf': {
      isPlayed = true;
      let attachedMovieBase = lwfInstance.rootMovie.attachMovie(
        'ef_001b',
        'battle2',
        1
      );
      let attachedMovie2 = lwfInstance.rootMovie.attachMovie(
        'ef_001',
        'battle',
        1
      );
      if (attachedMovieBase) {
        attachedMovieBase.moveTo(lwfInstance.width / 2, lwfInstance.height / 2);
      }
      if (attachedMovie2) {
        attachedMovie2.moveTo(lwfInstance.width / 2, lwfInstance.height / 2);
      }
      break;
    }
    case 'sp_effect_b1_00296.lwf': {
      isPlayed = true;
      let attachedMovieBase = lwfInstance.rootMovie.attachMovie(
        'ef_001_b',
        'battle2',
        1
      );
      let attachedMovie2 = lwfInstance.rootMovie.attachMovie(
        'ef_001',
        'battle',
        1
      );
      if (attachedMovieBase) {
        attachedMovieBase.moveTo(lwfInstance.width / 2, lwfInstance.height / 2);
      }
      if (attachedMovie2) {
        attachedMovie2.moveTo(lwfInstance.width / 2, lwfInstance.height / 2);
      }
      break;
    }
    case 'sp_effect_a2_00202.lwf': {
      isPlayed = true;
      let attachedMovie = lwfInstance.rootMovie.attachMovie(
        'ef_001',
        'battle',
        1
      );
      attachScenesForCard4025741FinishSkill(lwfInstance, attachedMovie, 370);
      if (attachedMovie) {
        attachedMovie.moveTo(lwfInstance.width / 2, lwfInstance.height / 2);
      }
      break;
    }
    case 'sp_effect_a2_00203.lwf': {
      isPlayed = true;
      let attachedMovie = lwfInstance.rootMovie.attachMovie(
        'ef_001',
        'battle',
        1
      );
      if (attachedMovie) {
        attachedMovie.moveTo(lwfInstance.width / 2, lwfInstance.height / 2);
      }
      attachScenesForCard4025741FinishSkill(lwfInstance, attachedMovie, 280);
      break;
    }
    case 'battle_301261.lwf': {
      isPlayed = true;
      let attachedMovie = lwfInstance.rootMovie.attachMovie(
        triggerScene === 'ef_002' ? triggerScene : 'ef_001',
        'battle',
        1
      );
      if (attachedMovie) {
        attachedMovie.moveTo(lwfInstance.width / 2, lwfInstance.height / 2);
      }
      break;
    }

    case 'sp_effect_b1_00251.lwf': {
      isPlayed = true;
      attachScenesForCard4026541FinishSkill(lwfInstance);
      break;
    }
    case 'sp_effect_b4_00302.lwf': {
      isPlayed = true;
      let attachedMovie = lwfInstance.rootMovie.attachMovie(
        'ef_002',
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
        attachedMovie2.moveTo(lwfInstance.width / 2, lwfInstance.height / 2);
      }
      break;
    }

    case 'sp_effect_a9_00121.lwf': {
      isPlayed = true;
      let attachedMovie = lwfInstance.rootMovie.attachMovie(
        'ef_001b',
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
        attachedMovie2.moveTo(lwfInstance.width / 2, lwfInstance.height / 2);
      }
      break;
    }

    case 'battle_301275.lwf': {
      isPlayed = true;
      let attachedMovie2 = lwfInstance.rootMovie.attachMovie(
        'ef_001r',
        'battle',
        1
      );
      let attachedMovie3 = lwfInstance.rootMovie.attachMovie(
        'ef_002',
        'battle3',
        1
      );
      let attachedMovie = lwfInstance.rootMovie.attachMovie(
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
      if (attachedMovie3) {
        attachedMovie3.moveTo(lwfInstance.width / 2, lwfInstance.height / 2);
      }
      console.log(lwfInstance);

      break;
    }

    case 'sp_effect_a1_00451.lwf': {
      isPlayed = true;
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
        attachedMovie2.moveTo(lwfInstance.width / 2, lwfInstance.height / 2);
      }
      break;
    }

    case 'sp_effect_a1_00452.lwf': {
      isPlayed = true;
      let attachedMovie = lwfInstance.rootMovie.attachMovie(
        'ef_001b',
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
        attachedMovie2.moveTo(lwfInstance.width / 2, lwfInstance.height / 2);
      }
      break;
    }

    case 'sp_effect_a1_00453.lwf': {
      isPlayed = true;

      let attachedMovie = lwfInstance.rootMovie.attachMovie(
        'ef_001b',
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
        attachedMovie2.moveTo(lwfInstance.width / 2, lwfInstance.height / 2);
      }
      break;
    }

    case 'sp_effect_a1_00392.lwf': {
      isPlayed = true;

      let attachedMovie = lwfInstance.rootMovie.attachMovie(
        'ef_001',
        'battle',
        1
      );
      attachScenesForCard9526401FinishSkill(lwfInstance, attachedMovie);
      if (attachedMovie) {
        attachedMovie.moveTo(lwfInstance.width / 2, lwfInstance.height / 2);
      }

      break;
    }

    case 'sp_effect_a2_00207.lwf': {
      isPlayed = true;

      let attachedMovie = lwfInstance.rootMovie.attachMovie(
        'ef_002',
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
        attachedMovie2.moveTo(lwfInstance.width / 2, lwfInstance.height / 2);
      }
      break;
    }

    case 'sp_effect_b1_00324.lwf': {
      isPlayed = true;

      let attachedMovie = lwfInstance.rootMovie.attachMovie(
        'ef_001b',
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
        attachedMovie2.moveTo(lwfInstance.width / 2, lwfInstance.height / 2);
      }
      break;
    }
    default:
      break;
  }
  return isPlayed;
}

export function playLWF(animationId: number, lwf: any) {
  let lastTime = performance.now();

  function render(currentTime: number) {
    if (lwf && lwf.active) {
      const deltaTime = (currentTime - lastTime) / 1000;
      lastTime = currentTime;
      lwf.exec(deltaTime);
      lwf.render();
    }
    animationId = requestAnimationFrame(render);
  }

  animationId = requestAnimationFrame(render);
}
