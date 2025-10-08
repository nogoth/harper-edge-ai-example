FROM node:18

WORKDIR /app

COPY package*.json ./
RUN npm install
RUN npm install -g harperdb #for that sweet sweet harper binary

COPY . .

# Expose the default Harper port
EXPOSE 9926

# Start the application
CMD ["npm", "run", "dev"]
