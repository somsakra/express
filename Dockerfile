FROM node:16.14-alpine

WORKDIR /app

COPY --from=built /built/*.pdf .

COPY *.js .

COPY *.json .

RUN npm install

CMD [ "node", "index.js" ]