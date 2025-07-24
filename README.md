# Automatización de Entorno – DevOps Kata

Este proyecto es parte del reto **"Kata de Automatización de Entorno"**, cuyo objetivo es demostrar habilidades en contenerización, CI/CD, y uso básico de Infraestructura como Código (IaC) con Terraform.

---

## Aplicación

Se trata de una aplicación en **Node.js + Express** con 3 rutas:

- `GET /` → Ruta principal 
- `GET /about` → Información básica
- `GET /status` → Retorna estado y timestamp 

---

## Contenerización con Docker

### Dockerfile

Docker Field Completo

Se creó un `Dockerfile` con buenas prácticas para empaquetar la aplicación:

```Dockerfile
FROM node:18
WORKDIR /usr/src/app
COPY package*.json ./
RUN npm install
COPY . .
EXPOSE 3000
CMD ["node", "app.js"]
```

### Comandos para levantar el contenedor localmente

```bash
# Construir la imagen
docker build -t automatizacion-de-entorno .

# Ejecutar el contenedor
docker run -p 3000:3000 automatizacion-de-entorno
```

Verifica en: [http://localhost:3000](http://localhost:3000)

---

## Automatización CI/CD con GitHub Actions

Se configuró un pipeline en `.github/workflows/ci-cd.yml` con:

- **Test Job**: Validación de código con ESLint
- **Deploy Job**: Build y Push de la imagen a Docker Hub


### Secretos usados

- `DOCKER_USER` → Usuario de Docker Hub
- `DOCKER_PASS` → Contraseña o token

Configurar en GitHub → Settings → Secrets → Actions

---

## Infraestructura como Código (IaC) con Terraform

Se creó un **módulo reutilizable** que simula el `docker tag` y `docker push`.

### Estructura

```
modules/
└── docker_push/
    ├── main.tf
    └── variables.tf

infra/
├── main.tf
├── variables.tf
└── terraform.tfvars
```

### Ejecutar IaC localmente

```bash
cd infra_Terraform/
terraform init
terraform apply
```


## 🖼️ Evidencias

- Imagen del contenedor corriendo localmente ✅
- Logs del pipeline en GitHub Actions ✅
- Salida de Terraform ✅

Se puede encontrar en la carpeta de Scripts un PDF con estas evidencias.

---

## 📌 Autor

**Nombre:** Edwar Santiago Vargas Rivera 
**Repositorio:** [\[URL del repositorio GitHub\]](https://github.com/Edwar421/Automatizacin-de-Entorno)
**App Desplegada AWS:** [\[URL app\]](http://automatizacion-env.eba-zbxf32wm.us-east-1.elasticbeanstalk.com)
