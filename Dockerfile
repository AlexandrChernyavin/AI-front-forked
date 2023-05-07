FROM node:alpine AS builder

WORKDIR /app

COPY . .

RUN npm install && npm run build

ENV HOST=0.0.0.0
ENV PORT=3000
EXPOSE 3000

ENTRYPOINT ["node"]

CMD ["./dist/server/entry.mjs"]