const fs = require('fs');
const path = require('path');

const configPath = path.join(process.env.HOME || '/home/node', '.openclaw', 'openclaw.json');
const config = JSON.parse(fs.readFileSync(configPath, 'utf8'));

const botToken = config.channels?.telegram?.botToken;
console.log('Starting Telegram bot with token:', botToken ? '✓' : '✗');

if (!botToken) {
  console.error('No Telegram bot token found');
  process.exit(1);
}

const grammy_path = '/home/node/.nvm/versions/node/v22.0.0/lib/node_modules/openclaw/node_modules/grammy';
const Bot = require(grammy_path).Bot;

const bot = new Bot(botToken);

bot.on('message', async (ctx) => {
  console.log('Message:', ctx.message.text);
  await ctx.reply('Cloud bot is alive! ☁️');
});

bot.start().then(() => console.log('✅ Telegram bot started!')).catch(console.error);
