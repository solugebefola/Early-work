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
    }
  };
})();
