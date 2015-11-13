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
    if(1===1){
      benchList = 3;
    }else{
      benchList = this.state.benches.map(function(bench){
        return <li>{bench.lat}</li>;
      });
    }

    return (
      <div>
        <ul>
          {benchList}
        </ul>
      </div>
    );
  }

});
