FROM node:22-alpine

WORKDIR /app

RUN npm install -g openclaw

RUN mkdir -p /home/node/.openclaw/workspace && chown -R node:node /home/node

USER node

EXPOSE 18789

ENV OPENCLAW_FOREGROUND=1

ENTRYPOINT ["openclaw", "gateway", "start"]
