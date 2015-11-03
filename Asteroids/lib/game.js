(function () {
  if (typeof Asteroids === "undefined") {
  window.Asteroids = {};
  }


  var Game = Asteroids.Game = function (DIM_X, DIM_Y, NUM_ASTEROIDS) {
    this.DIM_X = DIM_X;
    this.DIM_Y = DIM_Y;
    this.NUM_ASTEROIDS = NUM_ASTEROIDS;
    this.gameObjects = this.allObjects();
  };

  Game.prototype.allObjects = function () {
    var newShip = new Asteroids.Ship();
    var gameObjects = this.addAsteroids().push(newShip);
    return gameObjects;
  };

  Game.prototype.addAsteroids = function() {
    var allAsteroids = [];
    var that = this;
    for(var i = 0; i < this.NUM_ASTEROIDS; i++){
      allAsteroids.push(this.addOneAsteroid());
    }
    return allAsteroids;
  };

  Game.prototype.addOneAsteroid = function () {
    return new Asteroids.Asteroid(
      { pos: this.randomPosition() }
    );
  };

  Game.prototype.draw = function (ctx) {
    ctx.clearRect(0, 0, this.DIM_X, this.DIM_Y);
    this.allAsteroids = this.CheckCollisions();
    this.allAsteroids.forEach(function (asty) {
      asty.pos = this.wrap(asty.pos);
      asty.draw(ctx);
    }.bind(this));
  };

  Game.prototype.moveObjects = function () {
    this.allAsteroids.forEach(function (asty) {
      if (typeof(asty) !== "number"){
        asty.move();
      }
    });
  };

  Game.prototype.wrap = function (pos) {
    return [(pos[0] + this.DIM_X) % (this.DIM_X),
            (pos[1] + this.DIM_Y) % (this.DIM_Y)];
  };



  Game.prototype.CheckCollisions = function () {
    var asties = this.allAsteroids;
    for( var i = 0; i < this.allAsteroids.length; i++){
      for( var j = 0; j < this.allAsteroids.length; j++){
        if (
          i != j &&
          asties[i] != -1 &&
          asties[j] != -1 &&
          asties[i].CollideWith(asties[j])
        ) {
        
        }
      }
    }
    return asties.filter(function(element){
      return (typeof element !== "number");
    });
  };

  Game.prototype.randomPosition = function () {
    return [
      (Math.random() * this.DIM_X),
      (Math.random() * this.DIM_Y)
    ];
  };

})();
