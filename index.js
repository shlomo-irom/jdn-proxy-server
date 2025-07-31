const express = require('express');
const app = express();
const port = 3000;

app.get('/', (req, res) => {
  res.send('שלום עולם!');
});

app.listen(port, () => {
  console.log(`השרת מאזין ב-http://localhost:${port}`);
});
