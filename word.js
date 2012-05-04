(function() {
  var rand;

  rand = require('./rand');

  module.exports = function() {
    var Word;
    return Word = (function() {

      function Word(text, x, y) {
        this.text = text;
        this.x = x;
        this.y = y;
        this.r = rand();
        this.g = rand();
        this.b = rand();
      }

      return Word;

    })();
  };

}).call(this);
