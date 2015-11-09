var Autocomplete = React.createClass({

  getInitialState: function () {
    return ({ text: "" });
  },

  handleInput: function (e) {
    e.preventDefault();
    this.setState({text: e.target.value});
  },

  handleClick: function (e) {
    e.preventDefault();
    this.setState({text: e.target.textContent});
  },


  render: function () {
    var matchedNames = [];
    var matcher = new RegExp("^" + this.state.text)
    this.props.names.forEach ( function (el) {
      if (el.match(matcher)) {
        matchedNames.push(
          <li onClick={ this.handleClick }>{el}</li>
        );
      }
    });


    return (
      <div>
        <input type="text" onInput={ this.handleInput } value={ this.state.text } className="autovalue" />

        <ul onClick={ this.handleClick }>
          { matchedNames }
        </ul>
      </div>
    );
  }
});

var ClockWidget = React.createClass({

  getInitialState: function () {
    return ({ currentTime: new Date() });
  },

  componentDidMount: function () {
    this.clockUpdate = setInterval(this.intervalTime, 1000);
  },

  intervalTime: function () {
    this.setState({ currentTime: new Date() });
  },

  componentWillUnmount: function () {
    window.clearInterval(this.clockUpdate);
  },

  render: function () {
    return (
      <div>
        <p>{ this.state.currentTime.toString() }</p>
      </div>
    )
  }

});
