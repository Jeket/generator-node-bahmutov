// based on micro.js tutorial
// http://mxstbr.blog/2017/01/your-first-node-microservice/
const micro = require('micro')
const server = micro(function (req, res) {
  console.log(req.url)
  res.writeHead(200)
  res.end('Hello world\n\n')
})
server.listen(process.env.PORT || 1337)
