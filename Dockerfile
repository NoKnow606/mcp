# Use Node.js LTS version as the base image
FROM node:20-slim

# Set working directory
WORKDIR /app

# Install required system tools
RUN apt-get update && \
    apt-get install -y lsof procps && \
    rm -rf /var/lib/apt/lists/*

# Set environment variables
ENV NODE_ENV=production
ENV NPM_CONFIG_YES=true
ENV FORCE_COLOR=1
ENV NODE_OPTIONS="--no-warnings"
ENV WS_PORT=9009

# Create a script to handle port cleanup and startup
RUN echo '#!/bin/sh\n\
if lsof -ti:${WS_PORT}; then\n\
    lsof -ti:${WS_PORT} | xargs kill -9 || true\n\
fi\n\
exec npx --yes "@browsermcp/mcp@latest"\n\
' > /start.sh && chmod +x /start.sh

# Start the application
ENTRYPOINT ["/start.sh"]

