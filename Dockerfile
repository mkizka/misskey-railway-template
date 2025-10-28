ARG MISSKEY_VERSION
FROM misskey/misskey:${MISSKEY_VERSION} as misskey
FROM node:24.10.0-slim as base

FROM base as jq
RUN apt update && apt install -y jq
COPY --from=misskey /misskey/package.json ./
RUN jq '.scripts.migrateandstart = "node /railway/index.js && " + .scripts.migrateandstart' package.json > package.json.tmp \
  && mv package.json.tmp package.json

FROM base as build
COPY . .
RUN npm i -g corepack@latest \
  && corepack enable pnpm \
  && pnpm i
RUN pnpm build

FROM misskey
COPY --from=jq package.json ./
COPY --from=build dist/index.js /railway/
