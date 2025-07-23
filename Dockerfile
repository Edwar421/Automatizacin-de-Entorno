# Imagen base oficial de Node.js
FROM node:18

# Crear directorio de trabajo dentro del contenedor
WORKDIR /usr/src/app

# Copiar package.json y package-lock.json
COPY package*.json ./

# Instalar dependencias
RUN npm install

# Copiar todo el código
COPY . .

# Exponer el puerto de la app
EXPOSE 3000

# Comando para ejecutar la app
CMD ["node", "app.js"]
