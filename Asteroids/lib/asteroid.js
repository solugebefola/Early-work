(function () {
  if (typeof Asteroids === "undefined") {
  window.Asteroids = {};
  }
  var Asteroid = Asteroids.Asteroid = function(obj) {
    var velo = Util.randomVec(Math.random() * 100);
    this.COLOR = #eee;
    this.RADIUS = 100;

    MovingObject.call(this,
       {
        pos: obj.pos,
        vel: velo,
        radius: this.RADIUS,
        color: this.COLOR
      })
  }

  Util.inherits(Asteroid, Asteroids.MovingObject)
})();
