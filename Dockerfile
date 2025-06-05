FROM node:20-alpine

# Instalar git + dependências de sistema para rodar o Chromium/puppeteer
RUN apk add --no-cache \
    git \
    chromium \
    nss \
    freetype \
    harfbuzz \
    ca-certificates \
    ttf-freefont

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .

EXPOSE 21465

CMD ["npm", "start"]
