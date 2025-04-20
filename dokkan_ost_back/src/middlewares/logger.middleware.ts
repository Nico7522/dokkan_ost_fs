import { Request, Response, NextFunction } from "express";
import fs, { readFile } from "node:fs";

const logger = (req: Request, res: Response, next: NextFunction) => {
  try {
    readFile("logs.json", "utf-8", (err, data) => {
      let jsonData = {
        url: req.url,
        adressInfo: req.socket.address(),
      };

      fs.writeFile(
        "./logs.json",
        `[${data.replace("[", "").replace("]", "")},${JSON.stringify(
          jsonData
        )}]`,
        next
      );
    });
  } catch (error) {
    console.log(error);
    next();
  }
};

export default logger;
