# Use an official Node.js runtime as the base image
FROM node:18.16.1-alpine

# Set the working directory inside the container
WORKDIR /app
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the app source code to the working directory
COPY . .

# Expose the port that the app will run on (adjust as needed)
EXPOSE 5000

# Define the command to run your Node.js app (adjust as needed)
CMD ["node", "index.js"]
