# Use official Node.js image as base
FROM node:18-alpine

# Set working directory (REQUIREMENT: lastName_firstName_site)
WORKDIR /shelly_Li_site

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy all source files
COPY . .

# Build the React application
RUN npm run build

# Install serve globally to serve the build
RUN npm install -g serve

# Expose port 3000 (React's default port)
EXPOSE 3000

# Start serving the application
CMD ["serve", "-s", "build", "-l", "3000"]
