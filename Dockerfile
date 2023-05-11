FROM node:alpine

WORKDIR /app

COPY package.json .

RUN npm install

COPY . .

RUN npm run build

ENTRYPOINT ["node"]

CMD ["./dist/server/entry.mjs"]
