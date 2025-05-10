import { ActiveSkill } from "../interfaces/active_skill";
import { Bgm } from "../interfaces/bgm";
import { Card } from "../interfaces/card";
import { Entrance } from "../interfaces/entrance";
import { Event } from "../interfaces/event";
import { FinishSkill } from "../interfaces/finish_skill";
import { Level } from "../interfaces/level";
import { StandBySkill } from "../interfaces/standby_skill";

export const cardChecker = (card: Card): Boolean => {
  if (
    typeof card.id !== "number" ||
    typeof card.name !== "string" ||
    typeof card.type !== "string" ||
    typeof card.class !== "string"
  ) {
    return false;
  }

  return true;
};

export const entranceChecker = (entrance: Entrance): Boolean => {
  if (
    typeof entrance.id !== "number" ||
    typeof entrance.cardId !== "number" ||
    typeof entrance.name !== "string" ||
    typeof entrance.bgmId !== "number"
  ) {
    return false;
  }

  return true;
};

export const activeSkillChecker = (activeSkill: ActiveSkill): Boolean => {
  if (
    typeof activeSkill.id !== "number" ||
    typeof activeSkill.cardId !== "number" ||
    typeof activeSkill.name !== "string" ||
    typeof activeSkill.bgmId !== "number"
  ) {
    return false;
  }

  return true;
};

export const bgmChecker = (bgm: Bgm): Boolean => {
  if (typeof bgm.id !== "number" || typeof bgm.description !== "string") {
    return false;
  }

  return true;
};

export const standBySkillChecker = (standBySkill: StandBySkill): Boolean => {
  if (
    typeof standBySkill.id !== "number" ||
    typeof standBySkill.description !== "string" ||
    typeof standBySkill.bgmId !== "number" ||
    typeof standBySkill.cardId !== "number"
  ) {
    return false;
  }
  return true;
};

export const finishSkillChecker = (finishSkill: FinishSkill): Boolean => {
  if (
    typeof finishSkill.id !== "number" ||
    typeof finishSkill.name !== "string" ||
    typeof finishSkill.bgmId !== "number" ||
    typeof finishSkill.standBySkillId !== "number"
  ) {
    return false;
  }
  return true;
};

export const eventChecker = (event: Event): boolean => {
  if (
    typeof event.id !== "number" ||
    typeof event.name !== "string" ||
    typeof event.category !== "string" ||
    typeof event.banner !== "string"
  ) {
    return false;
  }

  return true;
};

export const levelChecker = (level: Level): boolean => {
  if (
    typeof level.id !== "number" ||
    typeof level.title !== "string" ||
    typeof level.eventId !== "number" ||
    typeof level.level !== "number"
  ) {
    return false;
  }

  return true;
};
