const express = require("express");
const path = require("path");

const app = express();
const PORT = 3000;

app.use(express.urlencoded({ extended: true }));
app.use(express.static(path.join(__dirname, "public")));

app.get("/health", (req, res) => {
  res.send("ok");
});

app.post("/submit", (req, res) => {
  const name = req.body.name;

  res.send(`
    <html>
      <body style="font-family: Arial; text-align: center; padding: 50px;">
        <h1>I am Nikhil</h1>
        <h2>Hello, ${name}</h2>
        <a href="/">Go back</a>
      </body>
    </html>
  `);
});

app.listen(PORT, () => {
  console.log(`Server running on http://localhost:${PORT}`);
});