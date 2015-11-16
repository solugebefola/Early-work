var Search = React.createClass({

  clickMapHandler: function (coords) {
    this.props.history.pushState(null, "benches/new", coords);
  },

  render: function () {
    return (
      <div>
        <Map clickHandler={this.clickMapHandler}/>
        <Index />
      </div>
    );
  }
});
