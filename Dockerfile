FROM node:10.16.0-stretch as build
RUN apt update && apt install vim
RUN npm install -g @vue/cli

WORKDIR /vue-learn

COPY vue-learn/package.json /vue-learn/package.json
RUN npm i

COPY vue-learn/. /vue-learn

EXPOSE 80 443
CMD [ "npm", "run", "start" ]