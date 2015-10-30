Board = function(){
  this.grid = [["_", "_", "_"],["_", "_", "_"],["_", "_", "_"]],
  this.won = function(){

  },

  this.winner = function(){

  },

  this.isEmpty = function(pos){
    if(pos == "_"){
      return true;
    }else{
      return false;
    }
  },

  this.placeMark = function(pos, mark){
    if(this.isEmpty(pos)){
      var i = pos[0];
      var j = pos[1];
      this.grid[i][j] = mark;
    }
  },

  this.checkColumns = function() {
    var xCount = 0;
    var oCount = 0;
    for(var i=0; i < 3; i++){
      
    }
  }

}
