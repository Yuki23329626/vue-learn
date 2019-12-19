FROM node:10.16.0-stretch as build
RUN apt update && apt install nano

WORKDIR /backend
COPY package.json /backend/package.json
RUN npm i

COPY . /backend

EXPOSE 3000
CMD [ "npm", "run", "start" ]