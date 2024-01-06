const { build } = require("esbuild");

build({
  entryPoints: ["./src/index.js"],
  bundle: true,
  outdir: "dist",
  platform: "node", 
  minify: true,
});
