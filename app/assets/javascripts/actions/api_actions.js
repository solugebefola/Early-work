(function () {
  window.ApiActions = {
    receiveAllPokemons: function (pokemons) {
      AppDispatcher.dispatch({
        actionType: PokemonConstants.POKEMONS_RECEIVED,
        pokemons: pokemons
      });
    }
  };
})();
