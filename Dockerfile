FROM node:22.12-bookworm-slim

RUN apt-get update && apt-get install -y \
    git \
    python3 \
    make \
    g++ \
    cmake \
    && rm -rf /var/lib/apt/lists/*

RUN npm install -g openclaw@latest --unsafe-perm

EXPOSE 3000
CMD ["sh", "-lc", "openclaw gateway --dev --allow-unconfigured --bind lan --auth token --token ${OPENCLAW_GATEWAY_TOKEN} --port ${PORT:-3000}"]
