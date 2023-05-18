# Stage 1: Build the React app
FROM node:14.17.6 as build-stage

WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# # Install dependencies
# RUN npm ci --silent

# Copy the project files
COPY . .

# Build the app
RUN npm run build

# Stage 2: Serve the built app
FROM node:14.17.6 as production-stage

WORKDIR /app

# Install serve package for serving the built app
RUN npm install -g serve

# Copy the built app from the previous stage
COPY --from=build-stage /app/build ./build

# Expose the port that the app will run on
EXPOSE 3000

# Set the command to serve the app
CMD ["serve", "-s", "build"]