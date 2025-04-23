import dotenv from "dotenv";
dotenv.config();
import express from "express";
import bodyParser from "body-parser";
import cors from "cors";
import cardRoutes from "./routes/card_routes";
import entranceRoutes from "./routes/entrance_routes";
import activeSkillRoutes from "./routes/active_skill_routes";
import bgmRoutes from "./routes/bgm_routes";
import standBySkillRoutes from "./routes/standby_skill_routes";
import finishSkillRoutes from "./routes/finish_skill_routes";
import disablePostRequestMiddleware from "./middlewares/disable-post-request.middleware";
import logger from "./middlewares/logger.middleware";

const app = express();

// app.use(logger);
// app.use(disablePostRequestMiddleware);
app.use(cors());
app.use(express.static("public"));

const port = 3200;
app.use(bodyParser.json());
app.use(
  bodyParser.urlencoded({
    extended: true,
  })
);

app.use(cardRoutes);
app.use(entranceRoutes);
app.use(activeSkillRoutes);
app.use(bgmRoutes);
app.use(standBySkillRoutes);
app.use(finishSkillRoutes);

app.listen(port, () => {
  console.log(`server is listening on http://localhost:${port}....`);
});
