(function () {
  window.ApiUtil = {
    fetchAllPokemons: function () {
      $.ajax({
        url: "api/pokemon",
        type: "GET",
        success: function (pokemons) {
          ApiActions.receiveAllPokemons(pokemons);
        }
      });
    },

    getPokemonFromDatabase: function (id) {
      $.ajax({
        url: "api/pokemon/" + id,
        type: "GET",
        success: function (pokemon) {
          ApiActions.receiveSinglePokemon(pokemon);
        }
      });
    },

    createPokemon: function (newPokemon, callback) {
      $.ajax({
        url: "api/pokemon",
        type: "POST",
        data: {pokemon: newPokemon},
        dataType: "json",
        success: function (pokemon) {
          ApiActions.createNewPokemon(pokemon);
          callback(pokemon);
        }
      });
    }
  };
})();
