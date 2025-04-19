"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.finishSkillChecker = exports.standBySkillChecker = exports.bgmChecker = exports.activeSkillChecker = exports.entranceChecker = exports.cardChecker = void 0;
const cardChecker = (card) => {
    if (typeof card.id !== "number" ||
        typeof card.name !== "string" ||
        typeof card.type !== "string" ||
        typeof card.class !== "string") {
        return false;
    }
    return true;
};
exports.cardChecker = cardChecker;
const entranceChecker = (entrance) => {
    if (typeof entrance.id !== "number" ||
        typeof entrance.cardId !== "number" ||
        typeof entrance.name !== "string" ||
        typeof entrance.bgmId !== "number") {
        return false;
    }
    return true;
};
exports.entranceChecker = entranceChecker;
const activeSkillChecker = (activeSkill) => {
    if (typeof activeSkill.id !== "number" ||
        typeof activeSkill.cardId !== "number" ||
        typeof activeSkill.name !== "string" ||
        typeof activeSkill.bgmId !== "number") {
        return false;
    }
    return true;
};
exports.activeSkillChecker = activeSkillChecker;
const bgmChecker = (bgm) => {
    if (typeof bgm.id !== "number" || typeof bgm.description !== "string") {
        return false;
    }
    return true;
};
exports.bgmChecker = bgmChecker;
const standBySkillChecker = (standBySkill) => {
    if (typeof standBySkill.id !== "number" ||
        typeof standBySkill.description !== "string" ||
        typeof standBySkill.bgmId !== "number" ||
        typeof standBySkill.cardId !== "number") {
        return false;
    }
    return true;
};
exports.standBySkillChecker = standBySkillChecker;
const finishSkillChecker = (finishSkill) => {
    if (typeof finishSkill.id !== "number" ||
        typeof finishSkill.name !== "string" ||
        typeof finishSkill.bgmId !== "number" ||
        typeof finishSkill.standBySkillId !== "number") {
        return false;
    }
    return true;
};
exports.finishSkillChecker = finishSkillChecker;
