#!/usr/bin/bash
set -eu

mkdir .config
node /index.js | tee .config/default.yml
pnpm run migrateandstart
