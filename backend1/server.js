const express = require('express');

const app = express();

app.get('/', (req, res) => {
  res.send('Backend1 Working');
});

app.listen(3000, () => {
  console.log('Backend1 running');
});
