FROM node:20-alpine

# Instalar dependências de sistema para rodar o Chromium/puppeteer dentro do Alpine
RUN apk add --no-cache \
    chromium \
    nss \
    freetype \
    harfbuzz \
    ca-certificates \
    ttf-freefont

# Define o diretório de trabalho dentro do container
WORKDIR /app

# Copia somente package.json e, se houver, package-lock.json
COPY package*.json ./

# Executa npm install para instalar dependencies (agora 'wppconnect')
RUN npm install

# Copia o restante do código para /app
COPY . .

# Expõe a porta que o WPPConnect irá usar (21465)
EXPOSE 21465

# Comando para iniciar o bot
CMD ["npm", "start"]
