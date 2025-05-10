import { Request, Response, Router } from "express";
import pool from "../db/db";
import { Level } from "../interfaces/level";
import { levelChecker } from "../utils/checker";

const levelRoutes = Router();

levelRoutes.get("/levels", async (req: Request, res: Response) => {
  try {
    const results = await pool.query("SELECT * FROM levels");
    res.json(results.rows);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: "Error fetching levels" });
  }
});

levelRoutes.post("/levels", async (req: Request, res: Response) => {
  console.log("ici");

  const { id, title, event_id, level } = req.body;
  const areaLevel: Level = {
    id: +id,
    title,
    eventId: +event_id,
    level: +level,
  };

  const isValid = levelChecker(areaLevel);
  if (!isValid) {
    res.status(500).json({ error: "Invalid data" });
    return;
  }
  try {
    const text =
      "INSERT INTO levels (id, title, event_id, level) VALUES ($1, $2 , $3, $4)";
    const values = [
      areaLevel.id,
      areaLevel.title,
      areaLevel.eventId,
      areaLevel.level,
    ];
    await pool.query(text, values);
    res.status(201).json({ message: "Created" });
  } catch (error) {
    console.error(error);
    res.status(500).json({ error });
  }
});

export default levelRoutes;
