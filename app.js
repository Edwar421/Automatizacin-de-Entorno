const express = require('express');
const path = require('path');
const app = express();
const port = 3000;

// Servir archivos estáticos (CSS, imágenes, etc.)
app.use(express.static(path.join(__dirname, 'public')));

// Rutas
app.use('/', require('./routes/index'));
app.use('/about', require('./routes/about'));
app.use('/status', require('./routes/status'));

// Iniciar servidor
app.listen(port, () => {
  console.log(`Servidor corriendo en http://localhost:${port}`);
});
