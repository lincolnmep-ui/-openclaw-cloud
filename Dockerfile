FROM node:22-alpine

WORKDIR /app

# 安装 OpenClaw
RUN npm install -g openclaw

# 创建工作目录
RUN mkdir -p /home/node/.openclaw/workspace

# 设置权限
RUN chown -R node:node /home/node

USER node

# 暴露端口
EXPOSE 18789

# 启动 OpenClaw Gateway
CMD ["openclaw", "gateway", "start"]
