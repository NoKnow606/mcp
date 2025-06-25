# Use Node.js LTS version as the base image
FROM node:20-slim

# Set working directory
WORKDIR /app

# Copy package files
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy source code
COPY . .

# Build the project
RUN npm run build

# Set environment variables
ENV NODE_ENV=production

# Expose necessary ports (if needed)
# EXPOSE 9001 9002

# Start the application
CMD ["node", "dist/index.js"] 