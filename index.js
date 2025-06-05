// index.js
const { create } = require('wppconnect');

create({
  puppeteerOptions: {
    // Forçar o Chromium a rodar sem sandbox (necessário em containers Docker)
    args: ['--no-sandbox', '--disable-setuid-sandbox'],
  },
  headless: true, // rodar em “headless” (sem UI)
})
  .then((client) => {
    console.log('Sato Agenda Bot initialized.');

    client.onMessage((message) => {
      if (message.body === 'Oi') {
        client.sendText(message.from, 'Olá, eu sou o Sato Agenda Bot SaaS! 🚀');
      }
    });
  })
  .catch((error) => {
    console.error('Falha ao iniciar o cliente WPPConnect:', error);
  });
