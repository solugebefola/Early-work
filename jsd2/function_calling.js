Function.prototype.myBind = function(context) {
  var fn = this;
  return (function (){
    fn.apply(context);
  });
}


cat = {
  name: "sennacy",
  sayHi: function(){
    console.log("hello " + this.name);
  }
};

var bob = cat.sayHi;
bob();
bob = cat.sayHi.myBind(cat);
bob();
