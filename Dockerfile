# Using Node as Base image 
FROM node:16

# Setting up the working directory
WORKDIR /swiggy

# Copying the package.json and package-lock.json files to the working directory
COPY package*.json ./

# Installation of npm dependency
RUN npm install

# Copy all the source code
COPY . .

# Buildinf of the React app
RUN npm run build

# Expose port 3000 to access app
EXPOSE 3000

# Start your Node.js server
CMD [ "npm", "start" ]