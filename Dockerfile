FROM node:22.12.0-bullseye-slim AS deps

COPY package.json ./

RUN npm version --allow-same-version 0.0.1

FROM node:22.12.0-bullseye-slim AS build

WORKDIR /build

COPY --from=deps package.json ./
COPY yarn.lock ./

RUN yarn

COPY . .

FROM gcr.io/distroless/nodejs22-debian12:debug-nonroot-amd64-530158861eebdbbf149f7e7e67bfe45eb433a35c

COPY --chown=nonroot:nonroot --from=build /build .

CMD ["--experimental-strip-types", "--no-warnings", "index.ts"]
