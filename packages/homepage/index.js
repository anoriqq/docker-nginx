const express = require('express');
const app = express();
app.get('/*', (req, res, next) => {
  res.status(200).send({ok: true});
});
app.listen(8000, '127.0.0.11', () => {
  console.log('Listening on http://localhost:8000');
});
