FROM node:18-alpine as base

RUN npm install --location=global npm@9.8.0 serve

WORKDIR /app

# Build
FROM base as build

COPY --link package.json package-lock.json ./

RUN npm ci

COPY --link . .

RUN npm run build
RUN npm prune

FROM base

ENV PORT=80

EXPOSE 80

COPY --from=build /app/dist ./dist

CMD [ "serve", "-s", "-l", "tcp://0.0.0.0:80", "dist" ]