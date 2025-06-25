# Use Node.js LTS version as the base image
FROM node:20-slim

# Set working directory
WORKDIR /app

# Install required system tools
RUN apt-get update && apt-get install -y \
    git \
    lsof \
    procps \
    && rm -rf /var/lib/apt/lists/*

# Set environment variables
ENV NODE_ENV=production

# Expose necessary ports (if needed)
# EXPOSE 9001 9002

# Start the application with npx
# Using --yes to skip prompts
CMD ["npx", "@browsermcp/mcp@latest"] 
