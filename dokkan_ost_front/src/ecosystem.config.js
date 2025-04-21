module.exports = {
  apps: [
    {
      name: "angular-app",
      script: "./dokkan_ost/server/server.mjs",
      env: {
        PM2: "true",
      },
    },
  ],
};
