FROM node:18

# Set working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Set executable permissions for all binaries in node_modules/.bin
RUN chmod -R 755 ./node_modules/.bin

# Set specific executable permissions for mocha (if needed)
RUN chmod +x ./node_modules/.bin/mocha

# Copy the rest of the application
COPY . .

# Expose the application port
EXPOSE 3000

# Start the application
CMD ["npm", "start"]