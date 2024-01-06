#!/usr/bin/bash
set -eu

ENV_TO_YAML=https://raw.githubusercontent.com/mkizka/misskey-railway-template/main/dist/index.js
mkdir /misskey/.config
curl -s "$ENV_TO_YAML" | node | tee /misskey/.config/default.yml
pnpm run migrateandstart
