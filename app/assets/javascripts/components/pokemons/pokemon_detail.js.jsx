(function () {
  window.PokemonDetail = React.createClass({
    getInitialState: function () {
      return this.getStateFromStore();
    },

    componentDidMount: function () {
      PokemonStore.addPokemonDetailChangeListener(this._resetDetails);
    },

    componentWillUnmount: function () {
      PokemonStore.removePokemonDetailChangeListener(this._resetDetails);
    },

    _resetDetails: function () {
      this.setState(this.getStateFromStore());
    },

    getStateFromStore: function () {
      var pokemonId = parseInt(this.props.params.pokemonId);
      return { pokemon: PokemonStore.find(pokemonId) };
    },

    componentWillReceiveProps: function (nextProps) {
      ApiUtil.getPokemonFromDatabase(nextProps.params.pokemonId);
    },

    render: function () {
      var thePokemon;

      if (this.state.pokemon) {
        thePokemon =
          <div className="detail">
            <img src={this.state.pokemon.image_url} />
            <ul>
              {
                Object.keys(this.state.pokemon).map(function (prop) {
                  if (prop !== "image_url") {
                    return <li key={prop} className="prop">{prop + ": " + this.state.pokemon[prop]}</li>;
                  }
                }.bind(this))
              }
            </ul>
          </div>;
      }

      return (
        <div>
          {thePokemon}
        </div>
      );
    }
  });
})();
