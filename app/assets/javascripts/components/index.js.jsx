var Index = React.createClass({

  getInitialState: function () {
    return { benches: BenchStore.all() };
  },

  componentDidMount: function () {
    BenchStore.addChangeListener(this._onChange);
  },

  _onChange: function () {
    this.setState({ benches: BenchStore.all() });
  },

  render: function () {
    var benchList;
    if(this.state.benches){
      benchList = this.state.benches.map(function(bench){
        return <li key={bench.lat}>{bench.description.toString()}</li>;
      });
    }else{    }

    return (
      <div>
        <ul>
          <BenchForm />
          {benchList}
        </ul>
      </div>
    );
  }

});
