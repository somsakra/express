FROM google/cloud-sdk as built

WORKDIR /built

COPY ./config/key.json /config/key.json

COPY ./configurations /root/.config/gcloud/configurations

RUN gcloud storage cp gs://somsakra-bucket/temp/somsak.pdf .


##############################

FROM node:16.14-alpine

WORKDIR /app

COPY --from=built /built/*.pdf .

COPY *.js .

COPY *.json .

RUN npm install

CMD [ "node", "index.js" ]