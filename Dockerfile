FROM node:22-alpine
RUN npm install -g openclaw@latest
EXPOSE 3000
CMD ["openclaw", "gateway", "--port", "3000"]
