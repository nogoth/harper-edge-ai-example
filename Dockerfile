FROM node:18

WORKDIR /demo-app

COPY package*.json ./
RUN npm install
RUN npm install -g harperdb #for that sweet sweet harper binary

ENV TC_AGREEMENT="yes"
ENV ROOTPATH="/dev/shm/hdb"
ENV HDB_ADMIN_USERNAME="HDB_ADMIN"
ENV HDB_ADMIN_PASSWORD="password123"
ENV MAX_MEMORY="2048"
ENV SIMPLE_ADMIN_UI="yes"

RUN harperdb install

COPY . .

# Run some tests, because the instructions said to (possibly generates values in DB idk)
RUN npm run verify
RUN npm test

# Expose the apps Harper port
EXPOSE 9926
EXPOSE 9925

# Start the application
CMD ["harper", "dev", "."]
