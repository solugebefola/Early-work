var Game = React.createClass ({

  getInitialState: function () {
    var boardy =  new Minesweeper.Board(10,5);

    return {board: boardy, gameOver: false, gameWon: false };
  },

  updateGame: function () {

  },

  render: function () {
    return (
    <div>
      <Board board={this.state.board} updateGame={this.state.updateGame}/>
    </div>
    );
  }
});

var Board = React.createClass({

  // getInitialState: function () {
  //
  // },

  render: function () {
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
    this.setState({ appearance: "revealed" });
    this.props.tile.explored = true;
  },

  render: function () {

    if (this.props.tile.explored) {
      var numBombs = this.props.tile.adjacentBombCount();
      if (this.props.tile.flagged) {
        this.display = "⚑";
      }else if (this.props.tile.bombed) {
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
