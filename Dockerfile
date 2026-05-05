FROM node:18-alpine AS builder

WORKDIR /app

COPY package.json .

RUN npm install

COPY . .

RUN npm run build

FROM nginx AS production
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html
