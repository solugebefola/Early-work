(function () {

  var _pokemons = [];
  var resetPokemons = function (pokemons) {
    _pokemons = pokemons;
  };

  var POKEMONS_INDEX_CHANGE_EVENT = "change_event";

  window.PokemonStore = $.extend({}, EventEmitter.prototype, {
    all: function () {
      return _pokemons.slice(0);
    },

    fetch: function () {
      ApiUtil.fetchAllPokemons();
    },

    addPokemonsIndexChangeListener: function (callback) {
      this.on(POKEMONS_INDEX_CHANGE_EVENT, callback);
    },

    removePokemonsIndexChangeListener: function (callback) {
      this.removeListener(POKEMONS_INDEX_CHANGE_EVENT, callback);
    },

    changed: function () {
      this.emit(POKEMONS_INDEX_CHANGE_EVENT);
    },

    dispatcherID: AppDispatcher.register(function(payload){
      switch (payload.actionType) {
        case PokemonConstants.POKEMONS_RECEIVED:
          resetPokemons(payload.pokemons);
          PokemonStore.changed();
          break;
      }
    })
  });

})();
