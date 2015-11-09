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
      <p>Wheee</p>
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
      <div>
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

  render: function () {
    return (
      <p>T</p>
    );
  }
});




React.render (
  <Game />,
  document.getElementById("minesweeper")
)
