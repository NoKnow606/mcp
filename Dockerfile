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
pid=$(lsof -ti:${WS_PORT} 2>/dev/null)\n\
if [ ! -z "$pid" ]; then\n\
    kill -9 $pid 2>/dev/null || true\n\
fi\n\
exec npx --yes "@browsermcp/mcp@latest"\n\
' > /start.sh && chmod +x /start.sh

# Start the application
ENTRYPOINT ["/start.sh"]

