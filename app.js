// Minimal application baked into the Docker image.
const _ = require("lodash");

function main() {
  console.log(_.capitalize("docker cache lab ready"));
}

main();
