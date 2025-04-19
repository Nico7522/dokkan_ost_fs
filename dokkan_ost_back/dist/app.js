"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const dotenv_1 = __importDefault(require("dotenv"));
dotenv_1.default.config();
const express_1 = __importDefault(require("express"));
const body_parser_1 = __importDefault(require("body-parser"));
const cors_1 = __importDefault(require("cors"));
const card_routes_1 = __importDefault(require("./routes/card_routes"));
const entrance_routes_1 = __importDefault(require("./routes/entrance_routes"));
const active_skill_routes_1 = __importDefault(require("./routes/active_skill_routes"));
const bgm_routes_1 = __importDefault(require("./routes/bgm_routes"));
const standby_skill_routes_1 = __importDefault(require("./routes/standby_skill_routes"));
const finish_skill_routes_1 = __importDefault(require("./routes/finish_skill_routes"));
const disablePostRequestMiddleware = (req, res, next) => {
    if (req.method === "POST")
        res.status(401).json({ message: "Unauthorized" });
    else
        next();
};
const app = (0, express_1.default)();
app.use(disablePostRequestMiddleware);
app.use((0, cors_1.default)());
app.use(express_1.default.static("public"));
const port = 3200;
app.use(body_parser_1.default.json());
app.use(body_parser_1.default.urlencoded({
    extended: true,
}));
app.use(card_routes_1.default);
app.use(entrance_routes_1.default);
app.use(active_skill_routes_1.default);
app.use(bgm_routes_1.default);
app.use(standby_skill_routes_1.default);
app.use(finish_skill_routes_1.default);
app.listen(port, () => {
    console.log(`server is listening on http://localhost:${port}....`);
});
