var BenchForm = React.createClass({

  getInitialState: function () {
    return {lat: 20, lng: 20, description: "", seating: 0};
  },

  componentDidMount: function () {
    console.log(this.props.location.query);
    if (this.props.location.query){
      lat = this.props.location.query.lat;
      lng = this.props.location.query.lng;
      this.setState({lat: lat, lng: lng});
    }
  },

  handleInput: function (e) {
    e.preventDefault();
    var newState = {};
    var newVal = e.target.value;
    newState[e.target.name] = newVal;
    this.setState(newState);
  },

  handleBenchForm: function (e) {
    e.preventDefault();
    this.setState({
      lat: parseFloat(this.state.lat),
      lng: parseFloat(this.state.lng),
      seating: parseInt(this.state.seating)
    });

    ApiUtil.createBench(this.state);
    this.props.history.pushState(null, "/");
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
          <label>Seats
          <input
            type="number"
            className="bench-input"
            name="seating"
            onChange={this.handleInput}
            value={this.state.seating} />
          </label>
          <button type="Submit">Add Bench</button>
        </form>
      </div>
    );
  }
});
