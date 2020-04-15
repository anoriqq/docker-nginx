FROM node:12.16.2-alpine

WORKDIR /usr/src/app

COPY ./package.json ./

RUN yarn install

COPY . .

EXPOSE 8000
CMD ["node", "index.js"]
