(function () {
  window.ToysIndex = React.createClass({

    render: function () {
      var toysList;

      if(this.props.toys) {
        toysList = this.props.toys.map(function (toy) {
          return <ToyIndexItem toy={toy} />;
        });
      }

      return (
        <ul>
          {toysList}
        </ul>
      );

    }

  });
})();
