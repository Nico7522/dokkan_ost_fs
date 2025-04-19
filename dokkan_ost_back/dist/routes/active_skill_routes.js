"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = require("express");
const db_1 = __importDefault(require("../db/db"));
const checker_1 = require("../utils/checker");
const activeSkillRoutes = (0, express_1.Router)();
activeSkillRoutes.get("/active-skills", async (req, res) => {
    try {
        const results = await db_1.default.query("SELECT * FROM active_skills");
        res.json(results.rows);
    }
    catch (error) {
        console.error(error);
        res.status(500).json({ error: "Error fetching active skills" });
    }
});
activeSkillRoutes.post("/active-skills", async (req, res) => {
    const { id, bgm_id, name, card_id } = req.body;
    const activeSkill = {
        id: +id,
        name,
        bgmId: +bgm_id,
        cardId: +card_id,
    };
    console.log(activeSkill);
    const isValid = (0, checker_1.activeSkillChecker)(activeSkill);
    if (!isValid) {
        res.status(500).json({ error: "Invalid data" });
        return;
    }
    try {
        const text = "INSERT INTO active_skills (id, name, bgm_id, card_id) VALUES ($1, $2 , $3, $4)";
        const values = [
            activeSkill.id,
            activeSkill.name,
            activeSkill.bgmId,
            activeSkill.cardId,
        ];
        await db_1.default.query(text, values);
        res.status(201).json({ message: "Created" });
    }
    catch (error) {
        console.error(error);
        res.status(500).json({ error });
    }
});
exports.default = activeSkillRoutes;
