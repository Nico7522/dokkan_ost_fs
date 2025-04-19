"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = require("express");
const db_1 = __importDefault(require("../db/db"));
const checker_1 = require("../utils/checker");
const bgmRoutes = (0, express_1.Router)();
bgmRoutes.get("/bgm", async (req, res) => {
    try {
        const results = await db_1.default.query("SELECT * FROM background_music");
        res.json(results.rows);
    }
    catch (error) {
        console.error(error);
        res.status(500).json({ error: "Error fetching bgm" });
    }
});
bgmRoutes.post("/bgm", async (req, res) => {
    const { id, description } = req.body;
    const bgm = {
        id: +id,
        description,
    };
    const isValid = (0, checker_1.bgmChecker)(bgm);
    if (!isValid) {
        res.status(500).json({ error: "Invalid data" });
        return;
    }
    try {
        const text = "INSERT INTO background_music (id, description) VALUES ($1, $2)";
        const values = [bgm.id, bgm.description];
        await db_1.default.query(text, values);
        res.status(201).json({ message: "Created" });
    }
    catch (error) {
        console.error(error);
        res.status(500).json({ error });
    }
});
exports.default = bgmRoutes;
