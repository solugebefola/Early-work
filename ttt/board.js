Board = function(){
  this.grid = [["_", "_", "_"],["_", "_", "_"],["_", "_", "_"]]

};
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

Board.prototype.wonColumn = function() {
  var xCount = 0;
  var oCount = 0;
  for(var i=0; i < 3; i++){
    for(var j=0; j < 3; j++){
      if(this.grid[j][i] == "x"){
        xCount += 1;
      }else if (this.grid[j][i] == "o"){
        oCount += 1;
      }
    }if(xCount === 3){
      return "x";
    }else if (oCount === 3){
      return "o";
    }else{
      xCount = 0;
      oCount = 0;
    }
  }
  return "_";
};

Board.prototype.wonRow = function() {
  var xCount = 0;
  var oCount = 0;
  for(var i=0; i < 3; i++){
    for(var j=0; j < 3; j++){
      if(this.grid[i][j] == "x"){
        xCount += 1;
      }else if (this.grid[i][j] == "o"){
        oCount += 1;
      }
    }if(xCount === 3){
      return "x";
    }else if (oCount === 3){
      return "o";
    }else{
      xCount = 0;
      oCount = 0;
    }
  }
  return "_";
};

Board.prototype.wonForwardDiagonal = function() {
  var xCount = 0;
  var oCount = 0;
  for(var i=0; i < 3; i++){
    if(this.grid[i][i] == "x"){
      xCount += 1;
    }else if (this.grid[i][i] == "o"){
      oCount += 1;
    }
  }
  if(xCount === 3){
    return "x";
  }else if (oCount === 3){
    return "o";
  }else{
    xCount = 0;
    oCount = 0;
  }
  return "_";
};

Board.prototype.wonBackwardDiagonal = function() {
  var diagArray =  [
    this.grid[0][2],
    this.grid[1][1],
    this.grid[2][0]
  ]
  var xCount = 0;
  var oCount = 0;
  for (var i = 0; i < 3; i++){
    switch( diagArray[i] ){
      case "x":
        xCount += 1;
        break;
      case "o":
        oCount += 1;
        break;
      default:
        break;
    }
  }
  if (xCount == 3){
    return "x";
  }else if (oCount == 3) {
      return "o";
  }
  return "_";
};



module.exports = Board;
