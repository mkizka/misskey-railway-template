FROM misskey/misskey:2023.12.2
RUN mkdir railway \
  && curl -o railway/jq -kL https://github.com/jqlang/jq/releases/download/jq-1.7.1/jq-linux64 \
  && chmod +x railway/jq
RUN railway/jq '.scripts.migrateandstart = "node railway/index.js && " + .scripts.migrateandstart' package.json > package.json.tmp \
  && mv package.json.tmp package.json
COPY ./dist/index.js railway/index.js
