# Use Node.js LTS version as the base image
FROM node:20-slim

# Expose necessary ports (if needed)
# EXPOSE 9001 9002

# Start the application
CMD ["npx", "@browsermcp/mcp@latest"] 
