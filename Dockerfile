FROM node:22-alpine

# Install required system dependencies
RUN apk add --no-cache \
    python3 \
    make \
    g++ \
    libc6-compat
# Install OpenClaw
RUN npm install -g openclaw@latest --unsafe-perm

EXPOSE 3000

CMD ["openclaw", "gateway", "--port", "3000"]
