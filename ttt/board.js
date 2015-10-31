Board = function(){
  this.grid = [["_", "_", "_"],["_", "_", "_"],["_", "_", "_"]],

  this.placeMark = function(pos, mark){
  },

  this.checkColumns = function() {
    var xCount = 0;
    var oCount = 0;
    for(var i=0; i < 3; i++){

    }
  }

}
Board.prototype.won = function(){

};

Board.prototype.winner = function(){

};

Board.prototype.isEmpty = function(){
  if(pos == "_"){
    return true;
  }else{
    return false;
  }
};

Board.prototype.placeMark = function(pos, mark){
  if(this.isEmpty(pos)){
    var i = pos[0];
    var j = pos[1];
    this.grid[i][j] = mark;
  }
}


module.exports = Board;
