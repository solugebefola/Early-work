var Autocomplete = React.createClass({

  getInitialState: function(){
    return({ text: "" })
  },

  handleInput: function(e){
    e.preventDefault();
    this.setState({text: e.target.value});
  },

  handleClick: function(e){
    e.preventDefault();
    this.setState({text: e.target.textContent});
    document.getElementById("autovalue").value = e.target.textContent;
  },


  render: function() {
    var matchedNames = [];
    var matcher = new RegExp("^" + this.state.text)
    this.props.names.forEach ( function (el) {
      if (el.match(matcher)){
        matchedNames.push(
          <li onClick={ this.handleClick }>{el}</li>
        );
      }
    });


    return (
      <div>
        <input type={"text"} onInput={ this.handleInput } id={"autovalue"} />

        <ul onClick={ this.handleClick }>
          { matchedNames }
        </ul>
      </div>
    )
  }
});
