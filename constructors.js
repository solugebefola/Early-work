function Cat (name, owner) {
  this.name = name,
  this.owner = owner
};

Cat.prototype.cuteStatment = function() {
  return (this.owner + " loves " + this.name);
};

Cat.prototype.meow = function() {
  return "MEEEEEOOOOOOWWWwwww..."
}

var sennacy = new Cat("sennacy","jonathan");

var rocky = new Cat("rocky", "jonathan");

var markov = new Cat("markov", "ned");

markov.meow = function() {
  return "mew."
}
