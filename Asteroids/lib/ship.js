(function () {
  if (typeof Asteroids === "undefined") {
  window.Asteroids = {};
  }

  var Ship = Asteroids.Ship = function () {
    this.RADIUS = 10;
    this.COLOR = "#000";
    this.vel = [0,0]; 
  }

  Asteroids.Util.inherits(Ship, Asteroids.MovingObject);

}());
