var FilterParams = React.createClass({

  getInitialState: function () {
    return {minSeating: 0, maxSeating: 10};
  },

  handleRangeInput: function (e) {
    var newParams = {};
    var val = e.target.value;
    var key = e.target.name;
    newParams[key] = parseInt(val);
    // debugger
    this.setState(newParams);
    if(newParams && (newParams.minSeating > this.state.maxSeating)){
      this.setState({minSeating: this.state.maxSeating});
    }
    FilterParamsActions.paramsReceived(newParams);
  },

  render: function () {
    return(
      <div>
        <label> Min Seats
          <input type="number" name="minSeating" min="0" value={this.state.minSeating}
            onChange={this.handleRangeInput} />
        </label>
        <label> Max Seats
          <input type="number" name="maxSeating" min="0" value={this.state.maxSeating}
            onChange={this.handleRangeInput} />
        </label>
      </div>
    );
  }
});
