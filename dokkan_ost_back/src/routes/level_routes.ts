import { Request, Response, Router } from "express";
import pool from "../db/db";
import { Level } from "../interfaces/level";
import { levelChecker } from "../utils/checker";
import { mapToCamel } from "../utils/mapper";

const levelRoutes = Router();

levelRoutes.get("/levels", async (req: Request, res: Response) => {
  try {
    const results = await pool.query("SELECT * FROM levels");
    const data = await mapToCamel(results.rows);
    res.json(data);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: "Error fetching levels" });
  }
});

levelRoutes.get("/levels/:id", async (req: Request, res: Response) => {
  try {
    const { id } = req.params;
    const text =
      "SELECT rounds.round_number AS round_nb, cards.* FROM rounds JOIN cards_rounds ON cards_rounds.round_id = rounds.id JOIN cards ON cards.id = cards_rounds.card_id WHERE level_id = $1";

    const values = [id];
    const results = await pool.query(text, values);
    const data = results.rows.reduce((acc, item) => {
      let group = acc.find(
        (g: { roundNb: number }) => g.roundNb === item.round_nb
      );

      if (!group) {
        group = { roundNb: item.round_nb, cards: [] };
        acc.push(group);
      }

      group.cards.push({
        id: item.id,
        name: item.name,
        thumb: item.thumb,
        type: item.type,
        class: item.class,
        isLegendary: item.is_legendary,
      });

      return acc;
    }, []);

    res.json(data);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: "Error fetching level" });
  }
});

levelRoutes.post("/levels", async (req: Request, res: Response) => {
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
