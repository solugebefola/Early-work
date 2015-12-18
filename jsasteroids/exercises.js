var sumFoo = function () {
  var newArray = Array.prototype.slice.call(arguments);
  var result = 0;
  newArray.forEach(function(el){
    result += el;
  });
  return result;
};

console.log(sumFoo(1,2,3,4));



Function.prototype.myBind = function () {
  var newArray = Array.prototype.slice.call(arguments);
  var fn = this;
  return function () {
    var args = Array.prototype.slice.call(arguments);
    if (newArray.length > 1){
      return fn.apply(newArray[0], newArray.slice(1));
    }else{
      return fn.apply(newArray[0], args);
    }
  };
};

var curriedSum = function (numArgs) {
  var numbers = [];
  var _curriedSum = function(num){
    numbers.push(num);
    if( numbers.length === numArgs){
      return numbers.reduce( function (prev, el) {
        return  el + prev;
      });
    }
    return _curriedSum;
  };

  return _curriedSum.myBind(this);
};

Function.prototype.inherits = function (ParentClass){
  var args = Array.prototype.slice.call(arguments);
  var Surrogate = function(){  };
  Surrogate.prototype = ParentClass.prototype;
  this.prototype = new Surrogate();
  this.prototype.constructor = this;

  ParentClass.apply(this.prototype, args.slice(1));
}

function MovingObject (pos) {
  this.pos = pos;
};

function Ship () {};
Ship.inherits(MovingObject, 2);

function Asteroid () {};
Asteroid.inherits(MovingObject);

MovingObject.prototype.move = function () {this.pos += 1;};

aShip = new Ship();
console.log(aShip.pos)
aShip.move()
console.log(aShip.pos)
