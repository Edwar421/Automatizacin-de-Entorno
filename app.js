const express = require('express');
const path = require('path');
const app = express();
const port = process.env.PORT || 3000;


// Servir archivos estáticos (CSS, imágenes, etc.)
app.use(express.static(path.join(__dirname, 'public')));

// Rutas
app.use('/', require('./Routes/index'));
app.use('/about', require('./Routes/about'));
app.use('/status', require('./Routes/status'));

// Iniciar servidor
app.listen(port, () => {
  console.log(`Servidor corriendo en http://localhost:${port}`);
});
