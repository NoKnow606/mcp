# Use Node.js LTS version as the base image
FROM node:20-slim

# Set working directory
WORKDIR /app

# Install required system tools
RUN apt-get update && \
    apt-get install -y lsof procps && \
    rm -rf /var/lib/apt/lists/*

# Create a script to handle port cleanup and startup


# Start the application
CMD ["npx", "@browsermcp/mcp@latest"]

