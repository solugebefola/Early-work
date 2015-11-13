var Index = React.createClass({

  getInitialState: function () {
    return { benches: BenchStore.all() };
  }
  componentDidMount: function () {
    BenchStore.addChangeListener(this._onChange);
    ApiUtil.fetchBenches();
  },

  render: function () {
    return (
      <div>Hi there</div>
    );
  },

  _onChange: function () {
    this.setState({benches: BenchStore.all()});
  }
});
