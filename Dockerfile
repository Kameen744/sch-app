# Use an official node image as the base
FROM node:20

# Set working directory to /app
WORKDIR /app

# Copy the rest of the app
COPY ./* ./

# Install dependencies

RUN npm install

# Build the app
RUN npm run build

# Expose the port
EXPOSE 3000

# Run the command to start the development server
CMD ["npm", "run", "dev"]