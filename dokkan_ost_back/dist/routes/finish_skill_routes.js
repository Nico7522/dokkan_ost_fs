"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = require("express");
const db_1 = __importDefault(require("../db/db"));
const checker_1 = require("../utils/checker");
const finishSkillRoutes = (0, express_1.Router)();
finishSkillRoutes.get("/finishskills", async (req, res) => {
    try {
        const results = await db_1.default.query("SELECT * FROM finish_skills");
        res.json(results.rows);
    }
    catch (error) {
        console.error(error);
        res.status(500).json({ error: "Error fetching standby skills" });
    }
});
finishSkillRoutes.post("/finishskills", async (req, res) => {
    const { id, bgm_id, name, standby_skill_id } = req.body;
    const finishSkill = {
        id: +id,
        name,
        bgmId: +bgm_id,
        standBySkillId: +standby_skill_id,
    };
    console.log(finishSkill);
    const isValid = (0, checker_1.finishSkillChecker)(finishSkill);
    if (!isValid) {
        res.status(500).json({ error: "Invalid data" });
        return;
    }
    try {
        const text = "INSERT INTO finish_skills (id, name, bgm_id, standby_skill_id) VALUES ($1, $2, $3, $4)";
        const values = [
            finishSkill.id,
            finishSkill.name,
            finishSkill.bgmId,
            finishSkill.standBySkillId,
        ];
        await db_1.default.query(text, values);
        res.status(201).json({ message: "Created" });
    }
    catch (error) {
        console.error(error);
        res.status(500).json({ error });
    }
});
exports.default = finishSkillRoutes;
