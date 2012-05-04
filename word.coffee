rand = require './rand'
module.exports = () ->
  class Word
    constructor: (@text, @x, @y) ->
      # Generate a random colour
      @r = rand()
      @g = rand()
      @b = rand()