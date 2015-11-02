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
    this.CheckCollisions()
    this.allAsteroids.forEach(function (asty) {
      if (typeof(asty) !== "number") {
        asty.pos = this.wrap(asty.pos);
        asty.draw(ctx);
      }
    }.bind(this));
  };

  Game.prototype.moveObjects = function () {
    this.allAsteroids.forEach(function (asty) {
      if (typeof(asty) !== "number"){
        asty.move();
      }
    })
  }

  Game.prototype.wrap = function (pos) {
    return [(pos[0] + this.DIM_X) % (this.DIM_X),
            (pos[1] + this.DIM_Y) % (this.DIM_Y)]
  }

  Game.prototype.distanceBetween = function (pos1, pos2) {
    return Math.sqrt(
              Math.pow((pos1[0] - pos2[0]), 2) +
              Math.pow((pos1[1] - pos2[1]), 2)
            )
  }

  Game.prototype.CheckCollisions = function () {
    var asties = this.allAsteroids;
    for( var i = 0; i < this.allAsteroids.length; i++){
      for( var j = 0; j < this.allAsteroids.length; j++){
        var asty1 = asties[i];
        var asty2 = asties[j];
        if (i != j &&
          typeof asty1 !== "number" &&
          typeof asty2 !== "number") {
            if ((asty1.radius + asty2.radius) >=
                this.distanceBetween(asty1.pos, asty2.pos)) {
                  asties[i] = -1;
                  asties[j] = -1;
            }

        }else{

        }
      }
    }
  }
})();
