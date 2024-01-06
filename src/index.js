const { readEnv } = require("read-env");
const yaml = require("js-yaml");
console.log(yaml.dump(readEnv("MISSKEY")));
