const express = require('express');
const app = express();
const port = 3000;

// Rutas
app.use('/', require('./Routes/index'));
app.use('/about', require('./Routes/about'));
app.use('/status', require('./Routes/status'));

app.listen(port, () => {
  console.log(`Servidor corriendo en http://localhost:${port}`);
});
