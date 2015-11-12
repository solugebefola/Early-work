(function () {
  window.PokemonDetail = React.createClass({
    getInitialState: function () {
      return this.getStateFromStore();
    },

    getStateFromStore: function () {
      var pokemonId = parseInt(this.props.params.pokemonId);
      return { pokemon: PokemonStore.find(pokemonId) };
    },

    render: function () {
      return (
        <div>
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
          </div>
        </div>
      );
    }
  });
})();
