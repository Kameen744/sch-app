# Stage 1: Build the application
FROM oven/bun:latest as builder

# Set the working directory inside the container
WORKDIR /app

# Copy the package.json and bun.lockb to the working directory
COPY package.json bun.lockb ./

# Install dependencies
RUN bun install

# Copy the rest of the application code
COPY . .

# Build the application
RUN bun run build

# Stage 2: Serve the application
FROM oven/bun:latest

# Set the working directory inside the container
WORKDIR /app

# Copy the built application from the builder stage
COPY --from=builder /app/build ./

# Expose the port the app runs on
EXPOSE 3000

# Command to start the application
CMD ["bun", "run", "index.js"]