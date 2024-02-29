import { Client, GatewayIntentBits, Partials } from 'discord.js';
import dotenv from 'dotenv';
import fs from 'fs';

const bot = new Client({
    'intents': [
        GatewayIntentBits.DirectMessages,
        GatewayIntentBits.Guilds,
        GatewayIntentBits.GuildPresences,
        GatewayIntentBits.GuildMembers,
        GatewayIntentBits.GuildMessages
    ],
    'partials': [Partials.Channel]
});

dotenv.config({ path: '.env.local' });
const tkn = process.env.BOT_TOKEN;
const secret = process.env.FLAG;
const attempts = new Map();

function logger(msg) {
    console.log(msg);
    fs.appendFile('/tmp/log/running.log', msg + '\r\n', (err) => {
        if (err) {
            console.error('Error writing log:', err);
        }
    });
}

process.on('uncaughtException', (err) => {
    console.error('General error:', err.message);
    console.error(err);
});

bot.on('messageCreate', async (m) => {
    const now = new Date(new Date().getTime() + 7 * 60 * 60 * 1000).toLocaleTimeString();
    if (m.channel.type !== 1 || m.author == bot.user) return;

    if (!attempts.has(m.author.id)) {
        attempts.set(m.author.id, 1);
    }
    const userAttempts = attempts.get(m.author.id);

    if (m.content == '##!FLAG--:v') {
        logger(`[${now}][PWNEED] [${m.author.username}]`);
        m.author.send(`NIH:\r\n**||${secret}||**\r\n\r\nhttps://tenor.com/bZppv.gif`);
        attempts.set(m.author.id, 1);
    } else if (m.content == secret) {
        logger(`[${now}][DIRECT] [${m.author.username}]`);
        m.author.send(`Njirr dukun lo!?\r\n\r\nhttps://tenor.com/pSTf52Eo98W.gif`);
        attempts.set(m.author.id, 1);
    }
    else {
        if (userAttempts == 2) {
            m.author.send('Hint:\r\n||Flag diawali dengan string **ACT_CTF{**||\r\n||Dan diakhiri dengan string **}** :V||');
            attempts.set(m.author.id, userAttempts + 1);
        }
        else if (userAttempts == 4) {
            m.author.send('OK, OK. Magic wordsnya: ||**##!FLAG--:v**||');
            attempts.set(m.author.id, userAttempts + 1);
        } else if (userAttempts > 4) {
            m.author.send('WOIII, Magic wordsnya: **##!FLAG--:v**\r\nDah, jangan spam. kalo ntar akun lu kena ban discord bukan tanggung jawab gw :V');
            attempts.set(m.author.id, userAttempts + 1);
        }
        else {
            m.author.send(`Are you a real witch?`);
            attempts.set(m.author.id, userAttempts + 1);
        }
    }
});

bot.login(tkn).then(() => {
    logger(`Logged in as ${bot.user.tag}`);
    bot.user.setActivity(`-> Say The Magic Words`);
}, (error) => {
    console.error('Login error:', error);
});