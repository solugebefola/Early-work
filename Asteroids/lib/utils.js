(function () {
  if (typeof Asteroids === "undefined") {
  window.Asteroids = {};
  }

  var Util = Asteroids.Util = {};

  Util.inherits = function (ChildClass, ParentClass) {
    var args = Array.prototype.slice.call(arguments);
    var Surrogate = function(){  };
    Surrogate.prototype = ParentClass.prototype;
    ChildClass.prototype = new Surrogate();
    ChildClass.prototype.constructor = ChildClass;
  };

  Util.randomVec = function (length) {
    var theta = Math.random() * 2 * Math.PI;
    var pos = [];
    pos[0] = length * Math.cos(theta);
    pos[1] = length * Math.sin(theta);

    return pos;
  };
})();
