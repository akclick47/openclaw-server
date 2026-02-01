FROM node:22.12-bookworm-slim

# Build tools needed for native deps (like node-llama-cpp)
RUN apt-get update && apt-get install -y \
  git \
  python3 \
  build-essential \
  cmake \
  pkg-config \
  ca-certificates \
  && rm -rf /var/lib/apt/lists/*

# (Optional) less noisy logs
ENV npm_config_fund=false \
    npm_config_audit=false \
    npm_config_update_notifier=false

RUN npm install -g openclaw@latest --unsafe-perm

EXPOSE 3000
CMD ["sh", "-lc", "openclaw gateway --bind lan --port ${PORT:-3000}"]
