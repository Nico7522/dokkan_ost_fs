import { Request, Response, NextFunction } from "express";

const disablePostRequestMiddleware = (
  req: Request,
  res: Response,
  next: NextFunction
): void => {
  if (req.method === "POST") res.status(401).json({ message: "Unauthorized" });
  else next();
};

export default disablePostRequestMiddleware;
