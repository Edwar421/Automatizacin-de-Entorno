# Automatización de Entorno – DevOps Kata

Este proyecto es parte del reto **"Kata de Automatización de Entorno"**, cuyo objetivo es demostrar habilidades en contenerización, CI/CD, y uso básico de Infraestructura como Código (IaC) con Terraform.

---

## Aplicación

Se trata de una aplicación en **Node.js + Express** con 3 rutas:

- `GET /` → Ruta principal (Hello World)
- `GET /about` → Información básica
- `GET /status` → Retorna estado y timestamp en JSON

---

## Contenerización con Docker

### Dockerfile

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
- **Build Job**: Construcción de la imagen Docker
- **Deploy Job**: Push de la imagen a Docker Hub


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


## ✅ Criterios cumplidos

| Requisito                                 | Estado |
|-------------------------------------------|--------|
| App sencilla (máx. 3 rutas)               | ✅     |
| Dockerfile funcional                      | ✅     |
| CI/CD con GitHub Actions                  | ✅     |
| Push automático a Docker Hub              | ✅     |
| IaC con Terraform                         | ✅     |
| Uso de módulo reutilizable                | ✅     |
| Separación de jobs en pipeline            | ✅     |
| Uso de secretos en GitHub Actions         | ✅     |

---

## 🖼️ Evidencias (capturas o video)

- Imagen del contenedor corriendo localmente ✅
- Logs del pipeline en GitHub Actions ✅
- Salida de Terraform ✅

---

## 📌 Autor

**Nombre:** Edwar Santiago Vargas Rivera 
**Repositorio:** [\[URL del repositorio GitHub\]](https://github.com/Edwar421/Automatizacin-de-Entorno)
