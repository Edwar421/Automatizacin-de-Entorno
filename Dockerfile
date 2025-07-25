# Imagen base liviana
FROM node:18-slim

# Crear directorio de trabajo en el contenedor
WORKDIR /app

# Copiar solo los archivos necesarios para instalar dependencias
COPY package*.json ./

# Instalar dependencias (en entorno de producción)
RUN npm install --production

# Copiar el resto del código
COPY . .

# Exponer el puerto 
EXPOSE 3000

# Comando por defecto para ejecutar
CMD ["node", "app.js"]
