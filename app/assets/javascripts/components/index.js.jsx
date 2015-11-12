(function () {
  window.Index = React.createClass({
    render: function () {
      return (
        <div>
          <div className="pokemon-index"><PokemonsIndex /></div>
          {this.props.children}
        </div>
      );
    }
  });
})();
