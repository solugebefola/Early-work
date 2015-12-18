(function () {
  window.ToyDetail = React.createClass({

    getStateFromStore: function () {
      var pokemonId = parseInt(this.props.params.pokemonId);
      var toyId = parseInt(this.props.params.toyId);
      var pokemon = PokemonStore.find(pokemonId);
      if (pokemon) {
        var toy = pokemon.toys.find(function (toy) {
          return (toy.id === toyId);
        });
        return { toy: toy };
      }
    },

    getInitialState: function () {
      return (this.getStateFromStore() || {});
    },

    _onChange: function () {
      this.setState(this.getStateFromStore());
    },

    componentDidMount: function () {
      PokemonStore.addPokemonDetailChangeListener(this._onChange);
    },

    componentWillUnmount: function () {
      PokemonStore.removePokemonDetailChangeListener(this._onChange);
    },

    componentWillReceiveProps: function (nextProps) {
      ApiUtil.getPokemonFromDatabase(nextProps.params.pokemonId);
    },

    render: function () {
      var toyDetail;

      if (this.state.toy) {
        toyDetail = <div className="detail"><img src={this.state.toy.image_url} /></div>;
      }

      return (
        <div>
          {toyDetail}
        </div>
      );
    }
  });
})();
