# Use official Node.js LTS image (small & stable)
FROM node:18-alpine

# Define working directory inside container
WORKDIR /app

# Copy dependency manifests first for better layer caching
COPY package*.json ./

# Install only production dependencies
RUN npm install --omit=dev

# Copy application source code
COPY . .

# Expose runtime port
EXPOSE 3000

# Define default runtime command
CMD ["npm", "start"]