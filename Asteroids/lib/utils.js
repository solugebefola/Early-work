(function () {
  if (typeof Asteroids === "undefined") {
  window.Asteroids = {};
  }

  var Util = Asteroids.Util = function (){}

  Util.prototype.inherits = function (ChildClass, ParentClass) {
    var args = Array.prototype.slice.call(arguments);
    var Surrogate = function(){  };
    Surrogate.prototype = ParentClass.prototype;
    ChildClass.prototype = new Surrogate();
    ChildClass.prototype.constructor = ChildClass;

    ParentClass.apply(ChildClass.prototype, args.slice(2));

  }

  Util.prototype.randomVec = function (length) {
    var theta = Math.random() * 2 * Math.PI;
    var pos = [];
    pos[0] = length * Math.cos(theta);
    pos[1] = length * Math.sin(theta);

    return pos;
  }
})();
