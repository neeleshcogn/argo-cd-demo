FROM node:alpine3.13

ENV PORT 3000

EXPOSE 3000

COPY nodeapp/package.json package.json
RUN npm install

COPY nodeapp/ .

CMD ["node", "./server.js"]
