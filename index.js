
const { create } = require('@wppconnect-team/wppconnect');

create().then(client => {
  console.log('Sato Agenda Bot initialized.');
  client.onMessage((message) => {
    if (message.body === 'Oi') {
      client.sendText(message.from, 'Olá, eu sou o Sato Agenda Bot SaaS! 🚀');
    }
  });
});
