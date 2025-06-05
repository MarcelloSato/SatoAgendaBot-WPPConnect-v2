
FROM node:20-alpine

# System dependencies
RUN apk add --no-cache   chromium   nss   freetype   harfbuzz   ca-certificates   ttf-freefont

# Working directory
WORKDIR /app

# Copy and install dependencies
COPY package*.json ./
RUN npm install

# Copy application code
COPY . .

# Expose WPPConnect port
EXPOSE 21465

# Start command
CMD ["npm", "start"]
