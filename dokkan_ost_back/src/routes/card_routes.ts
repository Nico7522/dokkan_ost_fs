import { Router, Request, Response } from "express";
import pool from "../db/db";
import { Card } from "../interfaces/card";
import { cardChecker } from "../utils/checker";
const cardRoutes = Router();

cardRoutes.get("/home", async (req: Request, res: Response, next) => {
  try {
    const text = "SELECT * FROM cards LIMIT 20 OFFSET $1";
    const offset = [req.query.offset];
    const results = await pool.query(text, offset);
    res.status(200).json(results.rows);
  } catch (error) {
    next(error);
    res.status(500).json({ error: "Error fetching cards" });
  }
});
cardRoutes.get("/cards", async (req: Request, res: Response) => {
  try {
    const query = req.query.name ? req.query.name : "";
    console.log(query);
    const text = "SELECT * FROM cards WHERE name ILIKE $1";
    const results = await pool.query(text, [`%${query}%`]);
    res.json(results.rows);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: "Error fetching cards" });
  }
});

cardRoutes.get("/cards/:id", async (req: Request, res: Response) => {
  try {
    const { id } = req.params;
    const text =
      "SELECT cards.*, entrances.bgm_id AS entrance_bgm_id, active_skills.bgm_id AS as_bgm_id, standby_skills.bgm_id AS standby_bgm_id, entrances.filename AS entrance_filename, active_skills.filename AS as_filename, standby_skills.filename AS standby_filename FROM cards FULL JOIN entrances ON cards.id = entrances.card_id FULL JOIN active_skills ON active_skills.card_id = cards.id FULL JOIN standby_skills ON cards.id = standby_skills.card_id WHERE cards.id = $1";
    const values = [id];
    const results = await pool.query(text, values);

    res.json(results.rows[0]);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: "Card not found" });
  }
});
cardRoutes.post("/cards", async (req: Request, res: Response) => {
  const card: Card = req.body;
  card.id = +card.id;

  const isValid = cardChecker(card);
  if (!isValid) {
    res.status(500).json({ error: "Invalid data" });
    return;
  }

  try {
    const text =
      "INSERT INTO cards (id, name, type, class) VALUES ($1, $2 , $3, $4)";
    const values = [card.id, card.name, card.type, card.class];
    await pool.query(text, values);
    res.status(201).json({ message: "Created" });
  } catch (error) {
    console.error(error);
    res.status(500).json({ error });
  }
});

export default cardRoutes;
