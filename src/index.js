const { readEnv } = require("read-env");
const yaml = require("js-yaml");
const fs = require("fs");

const misskeyEnv = readEnv("MISSKEY");
const config = yaml.dump(misskeyEnv);
fs.mkdirSync(".config", { recursive: true });
fs.writeFileSync(".config/default.yml", config);
console.log(
  JSON.stringify({
    msg: "Create default.yml from environment variables",
    config: misskeyEnv,
  }),
);
