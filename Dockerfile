# Use Node.js as the base image
FROM node:18.19

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install the dependencies
RUN npm config set registry https://registry.npmjs.org/
RUN npm install

# Copy the rest of the application code to the working directory
COPY . .

# Creates a "dist" folder with the production build
RUN npm run build

EXPOSE 3000

# Start the server using the production build
CMD [ "npm", "start" ]