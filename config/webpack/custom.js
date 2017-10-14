var path = require('path')

module.exports = {
  resolve: {
    alias: {
      'blog': path.join(__dirname, '..', '..', 'app', 'javascript', 'blog')
    }
  },
  devServer: {
    stats: 'errors-only'
  }
}
