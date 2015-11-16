var BenchForm = React.createClass({

  getInitialState: function () {
    return {lat: 0, lng: 0, description: ""};
  },

  componentWillReceiveProps: function (nextProps) {
    this.setState({lat: nextProps.lat, lng: nextProps.lng});
  },

  handleInput: function (e) {
    e.preventDefault();
    var newState = {};
    var newVal = e.target.value;
    // if (e.target.name === "lat" || e.target.name === "lng"){
    //   newVal = parseFloat(newVal);
    // }
    newState[e.target.name] = newVal;
    this.setState(newState);
  },

  handleBenchForm: function (e) {
    e.preventDefault();
    this.setState({
      lat: parseFloat(this.state.lat),
      lng: parseFloat(this.state.lng)
    });

    ApiUtil.createBench(this.state);
  },

  render: function () {

    return(
      <div>
        <form onSubmit={this.handleBenchForm}>
          <label>Latitude
          <input
            type="float"
            className="bench-input"
            name="lat"
            onChange={this.handleInput}
            value={this.state.lat} />
          </label>
          <label>Longitude
          <input
            type="float"
            className="bench-input"
            name="lng"
            onChange={this.handleInput}
            value={this.state.lng} />
          </label>
          <label>Description
          <input
            type="text"
            className="bench-input"
            name="description"
            onChange={this.handleInput}
            value={this.state.description} />
          </label>
          <button type="Submit">Add Bench</button>
        </form>
      </div>
    );
  }
});
