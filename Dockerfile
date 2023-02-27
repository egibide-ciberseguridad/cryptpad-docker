FROM node:lts-alpine

RUN apk add git

RUN npm install -g bower

RUN git clone https://github.com/xwiki-labs/cryptpad.git /cryptpad

WORKDIR /cryptpad

RUN npm install && bower install

RUN apk add bash nano curl

RUN cp /cryptpad/config/config.example.js /cryptpad/config/config.js

RUN sed -i 's/http:\/\/localhost:3000/http:\/\/cryptpad.test:3000/g' /cryptpad/config/config.js
RUN sed -i 's/\/\/httpAddress/httpAddress/g' /cryptpad/config/config.js

ENTRYPOINT npm run dev
