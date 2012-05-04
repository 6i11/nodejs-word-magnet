module.exports = (max) ->
  if max?
    Math.floor(Math.random() * 255)
  else
    Math.floor(Math.random() * 600)