var Search = React.createClass({

  clickMapHandler: function (latLng) {
    this.props.history
  },

  render: function () {
    return (
      <div>
        <Map />
        <Index />
      </div>
    );
  }
});
