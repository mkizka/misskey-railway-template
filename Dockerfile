ARG MISSKEY_VERSION
FROM misskey/misskey:${MISSKEY_VERSION} as misskey
FROM node:26.13.1-slim as base

FROM base as build
COPY . .
RUN npm i -g corepack@latest \
  && corepack enable pnpm \
  && pnpm i
RUN pnpm build

FROM misskey
COPY --from=build dist/index.js /railway/
CMD ["sh", "-c", "node /railway/index.js && node scripts/start.mjs --migrate"]
