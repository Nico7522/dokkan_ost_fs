import { Request, Response, NextFunction } from "express";
import fs, { readFile } from "node:fs";
import requestIp from "request-ip";

const logger = (req: Request, res: Response, next: NextFunction) => {
  try {
    let clientIp = requestIp.getClientIp(req);
    readFile("logs.json", "utf-8", (err, data) => {
      let jsonData = {
        date: new Date(),
        url: req.url,
        ip: clientIp,
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
