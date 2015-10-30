

var HanoiGame = function() {

  this.stack = [[1],[3,2],[]],

  this.isWon = function(){
    if(this.stack[1].length === 3 || this.stack[2].length === 3){
      return true;
    } else {
      return false;
    }
  },

  this.isValidMove = function(startTowerIdx, endTowerIdx){
    var startTower = this.stack[startTowerIdx].slice(-1)[0];
    var endTower = this.stack[endTowerIdx].slice(-1)[0];

    if (typeof startTower === "undefined"){
      return false;
    } else if ( typeof endTower === "undefined" ){
      return true;
    } else if (startTower > endTower){
      return false;
    } else {
      return true;
    }
  },

  this.move = function(startTowerIdx, endTowerIdx){
    if (this.isValidMove(startTowerIdx, endTowerIdx)){
      var disc = this.stack[startTowerIdx].pop();
      this.stack[endTowerIdx].push(disc);
    } else{
      console.log("invalid move");
    }
  },

  this.print = function(){
    console.log("0:" + JSON.stringify(this.stack[0]));
    console.log("1:" + JSON.stringify(this.stack[1]));
    console.log("2:" + JSON.stringify(this.stack[2]));
  },

  this.promptMove = function(callback){
    this.print();
    reader.question("Pick a tower to start from: ", function(fromTower) {
      reader.question("Which tower to move to? ", function(toTower){
        fromTower = parseInt(fromTower);
        toTower = parseInt(toTower);
        callback(fromTower, toTower);
      });
    });
    // callback(0,1);
  },

  this.run = function(completionCallback){
    that = this;
    this.promptMove(function (fromTower, toTower){

      that.move(fromTower, toTower);
      if (that.isWon()) {
        completionCallback();
      } else {
        that.run(completionCallback);
      }

    }.bind(this));
  }
}

var new_game = new HanoiGame();
new_game.run(function(){console.log("you won! Yayyy!");
              reader.close();});
