FROM node:22-alpine

WORKDIR /app

RUN npm install -g openclaw

RUN mkdir -p /home/node/.openclaw/workspace && chown -R node:node /home/node

USER node

EXPOSE 18789

# 同时启动 Gateway 和 Telegram bot
CMD sh -c "openclaw gateway start & node /home/node/.openclaw/telegram-bot.js"
