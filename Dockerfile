FROM node:alpine3.13

ENV PORT 3000

EXPOSE 3000

COPY nodeapp/package.json package.json

RUN npm config rm proxy && npm config rm https-proxy

RUN npm install

COPY nodeapp/ .

CMD ["node", "./server.js"]
