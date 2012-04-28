User = require("models/user")

module.exports = class Users
  constructor: ->
    @userArray = [
      new User('Mario', 'mario.png')
      new User('Luigi', 'luigi.png')
      new User('Koopa', 'koopa.png')
    ]
    @index = 0
  
  next: ->
    if @index < @userArray.length - 1
      @index++
    else 
      @index = 0
    @userArray[@index]