"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const pg_1 = require("pg");
const pool = new pg_1.Pool({
    user: "postgres",
    host: "localhost",
    database: "dokkan_ost",
    password: process.env.DB_PASSWORD,
    port: 5432,
});
exports.default = pool;
