# Use Node.js LTS version as the base image
FROM node:20-slim

# Set working directory
WORKDIR /app

# Set environment variables
ENV NODE_ENV=production
ENV NPM_CONFIG_YES=true
ENV FORCE_COLOR=1
ENV NODE_OPTIONS="--no-warnings"

# Expose necessary ports (if needed)
# EXPOSE 9001 9002

# Start the application with npx in non-interactive mode
ENTRYPOINT ["npx", "--yes"]
CMD ["@browsermcp/mcp@latest"]

