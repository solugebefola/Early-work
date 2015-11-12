(function () {
  window.ApiActions = {
    receiveAllPokemons: function (pokemons) {
      AppDispatcher.dispatch({
        actionType: PokemonConstants.POKEMONS_RECEIVED,
        pokemons: pokemons
      });
    },

    receiveSinglePokemon: function (pokemon) {
      AppDispatcher.dispatch({
        actionType: PokemonConstants.SINGLE_POKEMON_RECEIVED,
        pokemon: pokemon
      });
    }
  };
})();
