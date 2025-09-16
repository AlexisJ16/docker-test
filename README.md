# Docker Build & GitHub Actions CI/CD:

Este repositorio demuestra:

- **Dockerfile** multi-stage: build con Node.js y deploy con NGINX.
- **.dockerignore** configurado.
- **Workflow de GitHub Actions** (`.github/workflows/docker-publish.yml`) que:
  - Hace checkout del código.
  - Configura Docker Buildx.
  - Inicia sesión en Docker Hub usando **Secrets** (`DOCKERHUB_USERNAME`, `DOCKERHUB_TOKEN`).
  - Construye y publica la imagen en Docker Hub.

## Imagen publicada
- Docker Hub: https://hub.docker.com/r/<TU_USUARIO>/docker-test

## Prueba local
```bash
docker pull <TU_USUARIO>/docker-test:latest
docker run -p 8080:80 <TU_USUARIO>/docker-test:latest
# abrir http://localhost:8080
