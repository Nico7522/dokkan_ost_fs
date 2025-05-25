import { Request, Response, Router } from "express";

const roundRoutes = Router();

roundRoutes.get("/rounds/:id", async (req: Request, res: Response) => {});

export default roundRoutes;
