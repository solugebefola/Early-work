(function () {
  if (typeof Asteroids === "undefined") {
  window.Asteroids = {};
  }


  var MovingObject = Asteroids.MovingObject = function (attributes) {
    this.pos = attributes.pos;
    this.vel = attributes.vel;
    this.radius = attributes.radius;
    this.color = attributes.color;

  };

  MovingObject.prototype.draw = function(ctx) {
    ctx.fillStyle = this.color;
    ctx.beginPath();
    ctx.arc(
      this.pos[0],
      this.pos[1],
      this.radius,
      0,
      2 * Math.PI,
      false
    );

    ctx.fill();
  };

  MovingObject.prototype.move = function () {
    this.pos[0] += this.vel[0];
    this.pos[1] += this.vel[1];
  };

  MovingObject.prototype.CollideWith = function (otherObject) {
    if ((this.radius + otherObject.radius) >=
        this.distanceBetween(this.pos, otherObject.pos)) {
          return true;
    }else{
      return false;
    }
  };

  MovingObject.prototype.distanceBetween = function (pos1, pos2) {
    return Math.sqrt(
              Math.pow((pos1[0] - pos2[0]), 2) +
              Math.pow((pos1[1] - pos2[1]), 2)
            );
  };

})();
