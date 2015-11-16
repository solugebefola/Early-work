var Search = React.createClass({

  getInitialState: function () {
    return {bounds: {}, minSeating: 0, maxSeating: 10, benches: []};
  },

  componentDidMount: function () {
    FilterParamsStore.addChangeListener(this._onFilterChange);
  },

  clickMapHandler: function (coords) {
    this.props.history.pushState(null, "benches/new", coords);
  },

  render: function () {
    return (
      <div>
        <FilterParams />
        <Map clickHandler={this.clickMapHandler}/>
        <Index />
      </div>
    );
  },

  _onFilterChange: function () {
    var filterParams = FilterParamsStore.all();
    this.setState({
      bounds: filterParams.bounds,
      minSeating: filterParams.minSeating,
      maxSeating: filterParams.maxSeating
    });
    ApiUtil.fetchBenches(filterParams);
  }
});
