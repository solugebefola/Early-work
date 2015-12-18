(function () {
  if (typeof Asteroids === "undefined") {
  window.Asteroids = {};
  }

  var Ship = Asteroids.Ship = function () {
    this.RADIUS = 10;
    this.COLOR = "#eee";
    this.vel = [0,0];
    this.pos = [100,100];

    Asteroids.MovingObject.call(this,
       {
        pos: this.pos,
        vel: this.vel,
        radius: this.RADIUS,
        color: this.COLOR
      });//Asteroids.Game.prototype.randomPosition();
  };

  Asteroids.Util.inherits(Ship, Asteroids.MovingObject);

}());
