module.exports = {
  apps: [
    {
      name: "angular-app",
      script: "dist/server/server.mjs",
      env: {
        PM2: "true",
      },
    },
  ],
};
