(function () {

  var _pokemons = [];
  var resetPokemons = function (pokemons) {
    _pokemons = pokemons;
  };

  window.PokemonStore = $.extend({}, EventEmitter.prototype, {
    all: function () {
      return _pokemons.slice(0);
    },

    dispatcherID: AppDispatcher.register(function(payload){
      switch (payload.actionType) {
        case PokemonConstants.POKEMONS_RECEIVED:
          resetPokemons(payload.pokemons);
          break;
      }

    })
  });

})();
