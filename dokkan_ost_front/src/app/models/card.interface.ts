import { FinishSkill } from './finish-skill.interface';

export interface Card {
  id: number;
  name: string;
  class: string;
  type: string;
  thumb: number;
  isLegendary: boolean;
}

export interface CardDetails extends Card {
  entranceBgmId: number | null;
  asBgmId: number | null;
  standbyBgmId: number | null;
  entranceFilename: string | null;
  asFilename: string | null;
  standbyFilename: string | null;
  hasFinishSkill: boolean;
  finishSkills: FinishSkill[];
}
