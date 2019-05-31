const { environment } = require("@rails/webpacker");
const path = require("path");

environment.config.merge({
  resolve: {
    alias: {
      Utils: path.resolve(__dirname, "..", "..", "app/javascript/utils")
    }
  }
});

module.exports = environment;
