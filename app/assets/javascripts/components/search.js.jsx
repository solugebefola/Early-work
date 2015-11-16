var Search = React.createClass({

  clickMapHandler: function (latLng) {
    this.props.history.pushState(null, "benches/new");
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
