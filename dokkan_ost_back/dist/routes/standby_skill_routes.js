"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = require("express");
const db_1 = __importDefault(require("../db/db"));
const checker_1 = require("../utils/checker");
const standBySkillRoutes = (0, express_1.Router)();
standBySkillRoutes.get("/standbyskills", async (req, res) => {
    try {
        const results = await db_1.default.query("SELECT * FROM standby_skills");
        res.json(results.rows);
    }
    catch (error) {
        console.error(error);
        res.status(500).json({ error: "Error fetching standby skills" });
    }
});
standBySkillRoutes.post("/standbyskills", async (req, res) => {
    const { id, bgm_id, description, card_id } = req.body;
    const standBySkill = {
        id: +id,
        description,
        bgmId: +bgm_id,
        cardId: +card_id,
    };
    console.log(standBySkill);
    const isValid = (0, checker_1.standBySkillChecker)(standBySkill);
    if (!isValid) {
        res.status(500).json({ error: "Invalid data" });
        return;
    }
    try {
        const text = "INSERT INTO standby_skills (id, description, bgm_id, card_id) VALUES ($1, $2, $3, $4)";
        const values = [
            standBySkill.id,
            standBySkill.description,
            standBySkill.bgmId,
            standBySkill.cardId,
        ];
        await db_1.default.query(text, values);
        res.status(201).json({ message: "Created" });
    }
    catch (error) {
        console.error(error);
        res.status(500).json({ error });
    }
});
exports.default = standBySkillRoutes;
