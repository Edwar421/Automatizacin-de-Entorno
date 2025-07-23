const express = require('express');
const router = express.Router();

router.get('/', (req, res) => {
  res.send('Esta es la ruta /about');
});

module.exports = router;
