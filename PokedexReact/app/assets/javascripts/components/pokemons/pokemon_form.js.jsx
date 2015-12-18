(function () {
  window.PokemonForm = React.createClass ({
    mixins: [React.addons.LinkedStateMixin, ReactRouter.History],

    getInitialState: function () {
      return {name: "", poke_type: "", attack: "", defense: "", moves: ["run away"]};
    },

    displayNewPokemon: function(pokemon) {
      this.history.pushState(null, "pokemon/" + pokemon.id );

    },

    _onSubmit: function (e) {
      e.preventDefault();
      this.setState({ attack:  parseInt(this.state.attack),
                      defense: parseInt(this.state.defense) });
      ApiUtil.createPokemon(this.state, this.displayNewPokemon);
    },

    render: function () {
      return (
        <form onSubmit={this._onSubmit}>
          <input type="text"
            valueLink={this.linkState("name")} />
          <input type="text"
            valueLink={this.linkState("attack")} />
          <input type="text"
            valueLink={this.linkState("defense")} />
          <input type="text"
            valueLink={this.linkState("image_url")} />
          <select valueLink={this.linkState("poke_type")}>
            <option value=""/>
            {
              pokemonTypes.map(function (type){
                return (<option value={type}>{type}</option>);
              })
            }
          </select>
          <button>Submit</button>
        </form>
      );
    }



  });
})();
