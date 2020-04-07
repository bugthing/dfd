const path = require('path');

module.exports = {
  entry: path.join(__dirname, 'lib/dfd/web/assets/app.js'),
  output: {
    path: path.join(__dirname, 'lib/dfd/web/public/assets'),
    filename: "[name]-bundle.js",
    publicPath: 'http://localhost:9293/assets/'
  },
  devServer: {
    contentBase: path.join(__dirname, 'lib/dfd/web/assets'),
    compress: true,
    port: 9293
  }
}
