# Minimal multi-step Dockerfile for the Docker layer-caching lab.
# The dependency-install layer is cached separately from the app layer,
# so changing app.js does not force a reinstall of node_modules.

FROM node:20-alpine

WORKDIR /app

# Layer 1: dependencies (cached unless package.json changes)
COPY package.json ./
RUN npm install --omit=dev

# Layer 2: application source (rebuilt when app code changes)
COPY app.js ./

CMD ["node", "app.js"]
