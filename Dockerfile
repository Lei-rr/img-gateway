FROM node:22-alpine

WORKDIR /app
COPY server.mjs /app/server.mjs

EXPOSE 3001
CMD ["node", "server.mjs"]
