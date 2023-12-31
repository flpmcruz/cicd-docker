
# Use the official Node.js 14 image.
FROM node:18

# Create and change to the app directory.
WORKDIR /usr/src/app

# Copy application dependency manifests to the container image.
COPY package*.json ./

# Install production dependencies.
RUN npm install

# Copy local code to the container image.
COPY . .

# Build the application
RUN npm run build

# Serve the app on port 5000
EXPOSE 5000

# Run the web service on container startup.
CMD [ "npm", "run", "serve" ]