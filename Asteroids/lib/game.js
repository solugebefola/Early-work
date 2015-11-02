(function () {
  if (typeof Asteroids === "undefined") {
  window.Asteroids = {};
  }

  var Game = Asteroids.Game = function (DIM_X, DIM_Y, NUM_ASTEROIDS) {
    this.DIM_X = DIM_X;
    this.DIM_Y = DIM_Y;
    this.NUM_ASTEROIDS = NUM_ASTEROIDS;
    this.allAsteroids = this.addAsteroids();
  }

  Game.prototype.addAsteroids = function() {
    var allAsteroids = [];
    var that = this;
    for(var i = 0; i < this.NUM_ASTEROIDS; i++){
      allAsteroids.push(function() {
        var asty = new Asteroids.Asteroid(
          { pos:
              [
                (Math.random() * that.DIM_X),
                (Math.random() * that.DIM_Y)
              ]
          });
        return asty;
      }());
    }
    return allAsteroids
  }

  Game.prototype.draw = function (ctx) {
    ctx.clearRect(0, 0, this.DIM_X, this.DIM_Y);
    this.allAsteroids.forEach(function (asty) {
      asty.draw(ctx);
    })
  };

  Game.prototype.moveObjects = function () {
    this.allAsteroids.forEach(function (asty) {
      asty.move();
    })
  }

})();
