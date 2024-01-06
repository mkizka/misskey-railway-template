const { readEnv } = require("read-env");
const yaml = require("js-yaml");
const fs = require("fs");

const misskeyEnv = readEnv("MISSKEY", { separator: "_" })
const config = yaml.dump(misskeyEnv);
console.log(config);
fs.mkdirSync(".config", { recursive: true });
fs.writeFileSync(".config/default.yml", config);
