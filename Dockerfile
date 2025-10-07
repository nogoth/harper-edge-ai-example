FROM node:18

WORKDIR /app

# Copy package files
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application
COPY . .

# Expose the default Harper port
EXPOSE 9925

# Start the application
CMD ["npm", "run", "start"]