FROM node:alpine AS builder

WORKDIR /app

COPY package.json .

RUN npm install 

COPY . .

RUN npm run build

ENV HOST=0.0.0.0

ENTRYPOINT ["node"]

CMD ["./dist/server/entry.mjs"]