import { Request, Response, Router } from "express";
import pool from "../db/db";
import { Event } from "../interfaces/event";
import { eventChecker } from "../utils/checker";

const eventRoutes = Router();

eventRoutes.get("/events", async (req: Request, res: Response) => {
  try {
    const results = await pool.query("SELECT * FROM events");
    res.json(results.rows);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: "Error fetching events" });
  }
});

eventRoutes.post("/events", async (req: Request, res: Response) => {
  const { id, name, category, banner } = req.body;
  const event: Event = {
    id: +id,
    name,
    category,
    banner,
  };

  const isValid = eventChecker(event);
  if (!isValid) {
    res.status(500).json({ error: "Invalid data" });
    return;
  }
  try {
    const text =
      "INSERT INTO events (id, name, category, banner) VALUES ($1, $2 , $3, $4)";
    const values = [event.id, event.name, event.category, event.banner];
    await pool.query(text, values);
    res.status(201).json({ message: "Created" });
  } catch (error) {
    console.error(error);
    res.status(500).json({ error });
  }
});

export default eventRoutes;
