# syntax=docker/dockerfile:1

# Build stage: install dependencies and compile the React application
FROM node:18-alpine AS build

WORKDIR /app

# Install dependencies using the lockfile for reproducible builds
COPY package*.json ./
RUN npm ci

# Copy the rest of the application code and build the production assets
COPY . .
RUN npm run build

# Production stage: serve the built assets with Nginx
FROM nginx:1.25-alpine AS production

# Copy compiled assets from the build stage into Nginx's public directory
COPY --from=build /app/build /usr/share/nginx/html

# Expose the default HTTP port
EXPOSE 80

# Run Nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]
