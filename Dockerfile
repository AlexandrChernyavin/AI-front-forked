# Wait a minute...
# maybe...
FROM node:alpine as builder

WORKDIR /app

COPY . .

RUN npm install && npm run build

FROM nginx:alpine

RUN rm -rf /usr/share/nginx/html/*

COPY --from=builder /app/dist /usr/share/nginx/html

ENTRYPOINT ["nginx"]

# Some comment
CMD ["-g", "daemon off;"]