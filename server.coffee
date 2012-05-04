express = require 'express'
http = require 'http'
Word = require('./word')()

app = express()

app.configure () ->
  app.set 'views', __dirname + '/views'
  app.set 'view engine', 'jade'
  app.use express.favicon()
  app.use express.logger('dev')
  app.use express.static(__dirname + '/public')
  app.use express.bodyParser()
  app.use express.methodOverride()
  app.use app.router

app.configure 'development', () ->
  app.use express.errorHandler()
  
rand = require './rand'
  
words = [
  new Word "A",rand(), rand()
  new Word "B",rand(), rand()
  new Word "C",rand(), rand()
  new Word "D",rand(), rand()
  new Word "E",rand(), rand()
  new Word "F",rand(), rand()
  new Word "G",rand(), rand()
  new Word "H",rand(), rand()
  new Word "I",rand(), rand()
  new Word "J",rand(), rand()
  new Word "K",rand(), rand()
  new Word "L",rand(), rand()
  new Word "M",rand(), rand()
  new Word "N",rand(), rand()
  new Word "O",rand(), rand()
  new Word "P",rand(), rand()
  new Word "Q",rand(), rand()
  new Word "R",rand(), rand()
  new Word "S",rand(), rand()
  new Word "T",rand(), rand()
  new Word "U",rand(), rand()
  new Word "V",rand(), rand()
  new Word "W",rand(), rand()
  new Word "X",rand(), rand()
  new Word "Y",rand(), rand()
  new Word "Z",rand(), rand()
  new Word "0",rand(), rand()
  new Word "1",rand(), rand()
  new Word "2",rand(), rand()
  new Word "3",rand(), rand()
  new Word "4",rand(), rand()
  new Word "5",rand(), rand()
  new Word "6",rand(), rand()
  new Word "7",rand(), rand()
  new Word "8",rand(), rand()
  new Word "9",rand(), rand()
  new Word "+",rand(), rand()
  new Word "-",rand(), rand()
]

app.get '/', (req,res) ->
  res.render 'index', { words: words }

server = app.listen 3000

# socket.io
io = require('socket.io').listen server
io.set 'log level', 1

clients = [];
connected = 0

io.sockets.on 'connection', (socket) ->
  
  socket.on 'move', (d) ->
  
    words[d.data.id].x = d.data.pos.left
    words[d.data.id].y = d.data.pos.top
    socket.broadcast.emit 'move', {data: words[d.data.id], id: d.data.id}

console.log "Express server listening on port 3000"
