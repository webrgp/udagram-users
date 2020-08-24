FROM node:12
# Create app directory
WORKDIR /usr/src/app

# Copy packages to Docker
COPY package*.json ./

# Install clean dependencies
RUN npm ci 

# Install bcrypt
RUN npm install bcrypt 

# Bundle app source
COPY . .

# Run tsc on app
RUN npm run tsc

# Set the API’s port number
EXPOSE 8080

# Define Docker’s behavior when the image is run
CMD [ "npm", "run", "prod" ]