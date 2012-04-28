###Module Dependencies###
require("coffee-script")
stitch = require("stitch")
express = require("express")
fs = require('fs')
Logger = require("./app/lib/SimpleLogger")

logger = new Logger("[Server]")
argv = process.argv.slice(2)
html = ""
#stichでapplication.jsとして固める
myPackage = stitch.createPackage(
  paths: [ __dirname + "/app" ]

  dependencies: [
    __dirname + "/lib/jquery-1.7.1.min.js"
  ]
  )

app = express.createServer()

app.configure ->
  app.set "views", __dirname + "/views"
  app.use app.router
  app.use express.static(__dirname + "/public")
  app.get "/application.js", myPackage.createServer()

port = argv[0] or process.env.PORT or 3000
logger.info "Starting Server on port: #{port}"
app.listen port