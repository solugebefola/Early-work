var Game = React.createClass ({

  getInitialState: function () {
    var boardy =  new Minesweeper.Board(10,5);

    return {board: boardy, gameOver: false, gameWon: false };
  },

  updateGame: function (tile, flagging) {
    if (flagging) {
      tile.toggleFlag();
    }else{
      tile.explore();
    }
    debugger
    if (this.state.board.won) {
      console.log("winner!");
    }else if (this.state.board.lost){
      console.log("loser!");
    }

  },

  render: function () {
    return (
    <div>
      <Board board={this.state.board}
        updateGame={this.updateGame}/>
    </div>
    );
  }
});

var Board = React.createClass({

  render: function () {
    self = this;
    return (
      <div className="grid">
        { this.props.board.grid.map( function (row, rowIdx) {
          return (<div>{
            row.map( function (el, colIdx) {
              var key = rowIdx.toString() + colIdx.toString();
              return (<Tile tile={el} updateGame={this.props.updateGame} key={ key } />)
            }.bind(this))
          }</div>)
        }.bind(this))
      }
      </div>
    )
  }
});

var Tile = React.createClass({

  getInitialState: function () {
    return (
      { appearance: "hidden" }
    );
  },

  handleClick: function (e) {
    e.preventDefault();
    var flagging = e.altKey;
    this.props.updateGame(this.props.tile, flagging);
    if (!this.props.tile.flagged){
      this.setState({ appearance: "revealed" });
    }
  },

  render: function () {

    if (this.props.tile.flagged && this.state.appearance === "hidden") {
      this.display = "⚑";
    }else if (this.props.tile.explored) {
      var numBombs = this.props.tile.adjacentBombCount();
      if (this.props.tile.bombed) {
        this.display = "💣";
      }else{
        this.display = numBombs.toString();
      }
    }

    return (
      <div className={this.state.appearance +" tile"} onClick={this.handleClick} >{ this.display }</div>
    );
  }
});




React.render (
  <Game />,
  document.getElementById("minesweeper")
)
