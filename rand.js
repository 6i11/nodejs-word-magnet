(function() {

  module.exports = function(max) {
    if (max != null) {
      return Math.floor(Math.random() * 255);
    } else {
      return Math.floor(Math.random() * 600);
    }
  };

}).call(this);
