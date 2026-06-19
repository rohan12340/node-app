const express = require("express");

const app = express();

app.get("/", (req, res) => {
  res.send("Hello brooooooo");
});

app.get("/health", (req, res) => {
  res.send("Application is healthy");
});

app.listen(3000, () => {
  console.log("Server running on port 3000");
});

