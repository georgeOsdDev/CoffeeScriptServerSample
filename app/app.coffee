User = require("models/user")
Users = require("models/users")
Logger = require("./lib/SimpleLogger")
appLogger = new Logger("[App]")
users = new Users()

App =
  init: ->
    appLogger.info 'init'
    $ = jQuery
    template = require("views/users/show")
    view     = template(new User())
    $("#main").html(view)
    return

  next: =>
    appLogger.info 'next'
    template = require("views/users/show")
    next = users.next()
    view     = template(next)
    $("#main").html(view)
    return

  showAll: =>
    appLogger.info 'showAll'
    template = require("views/users/showAll")
    view     = template(users)
    $("#main").html(view)
    return

module.exports = App

