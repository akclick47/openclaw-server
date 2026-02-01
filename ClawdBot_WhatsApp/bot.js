const { Client, LocalAuth } = require('whatsapp-web.js');
const qrcode = require('qrcode-terminal');

// Initialize the WhatsApp Client
const client = new Client({
    authStrategy: new LocalAuth(), // This helps store the session for future use
});

// Event when the bot is ready
client.on('ready', () => {
    console.log('Bot is ready!');
});

// Event to handle the QR code for login
client.on('qr', (qr) => {
    qrcode.generate(qr, { small: true });
});

// Event to handle incoming messages
client.on('message', (message) => {
    console.log('Received message:', message.body);
    
    // Log the message sender
    console.log('From:', message.from);
    console.log(message.body);  // Log incoming message body
    
    // Example command: reply to the message with 'Hello!'
    if (message.body === '!hello') {
        console.log('Sending response...');
        message.reply('Hello! This is your ClawDBot!');
    }
    else if (message.body === '!help') {
        message.reply('Here are the available commands:\n!hello - Greet the bot\n!time - Get current time');
    } else if (message.body === '!time') {
        message.reply('Current time: ' + new Date().toLocaleString());
    }
});

// Initialize the client
client.initialize();
