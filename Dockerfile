#specify the base image
FROM node:alpine3.12

#specifying the working directory inside docker
WORKDIR /usr/app

#installing dependencies which is required ti run node.js
COPY ./package.json ./
RUN npm install
COPY ./ ./

#default startup command
CMD [ "npm", "start" ]