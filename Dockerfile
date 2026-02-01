FROM node:22-alpine

RUN apk add --no-cache python3 make g++ libc6-compat git
    python3 \
    make \
    g++ \
    libc6-compat \
    git

RUN npm install -g openclaw@latest --unsafe-perm

ENV PORT=3000
EXPOSE 3000

CMD ["sh", "-lc", "openclaw gateway --bind lan --port ${PORT}"]
