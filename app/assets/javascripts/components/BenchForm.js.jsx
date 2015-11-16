var BenchForm = React.createClass({

  getInitialState: function () {
    return {lat: 0, lng: 0, description: ""};
  },

  handleInput: function (e) {
    e.preventDefault();
    var newState = {};
    newState[e.target.name] = e.target.value;
    this.setState(newState);
  },

  render: function () {

    return(
      <div>
        <label>Latitude
        <input
          type="text"
          className="bench-input"
          name="lat"
          onChange={this.handleInput}
          value={this.state.lat} />
        </label>
        <label>Longitude
        <input
          type="text"
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
        <button onClick={this.handleBenchForm}>Add Bench</button>
      </div>
    );
  }
});
