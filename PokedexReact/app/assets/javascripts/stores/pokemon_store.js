(function () {

  var _pokemons = [];
  var resetPokemons = function (pokemons) {
    _pokemons = pokemons;
  };

  var resetSinglePokemon = function (pokemon) {
    var idx = _pokemons.findIndex(function (poke) { return poke.id === pokemon.id; });
    _pokemons[idx] = pokemon;
  };

  var addNewPokemon = function (pokemon) {
    _pokemons.push(pokemon);
  };

  var POKEMONS_INDEX_CHANGE_EVENT = "change_event";
  var POKEMON_DETAIL_CHANGE_EVENT = "detail_change";
  var NEW_POKEMON_CHANGE_EVENT = "new_pokemon"

  window.PokemonStore = $.extend({}, EventEmitter.prototype, {
    all: function () {
      return _pokemons.slice(0);
    },

    fetch: function () {
      ApiUtil.fetchAllPokemons();
    },

    find: function (id) {
      return _pokemons.find(function (pokemon) {
        return pokemon.id === id;
      });
    },

    addPokemonsIndexChangeListener: function (callback) {
      this.on(POKEMONS_INDEX_CHANGE_EVENT, callback);
    },

    removePokemonsIndexChangeListener: function (callback) {
      this.removeListener(POKEMONS_INDEX_CHANGE_EVENT, callback);
    },

    addPokemonDetailChangeListener: function (callback) {
      this.on(POKEMON_DETAIL_CHANGE_EVENT, callback);
    },

    removePokemonDetailChangeListener: function (callback) {
      this.removeListener(POKEMON_DETAIL_CHANGE_EVENT, callback);
    },

    addNewPokemonChangeListener: function (callback) {
      this.on(NEW_POKEMON_CHANGE_EVENT, callback);
    },

    removeNewPokemonChangeListener: function (callback) {
      this.removeListener(NEW_POKEMON_CHANGE_EVENT, callback);
    },

    changed: function (event) {
      this.emit(event);
    },

    dispatcherID: AppDispatcher.register(function(payload){
      switch (payload.actionType) {
        case PokemonConstants.POKEMONS_RECEIVED:
          resetPokemons(payload.pokemons);
          PokemonStore.changed(POKEMONS_INDEX_CHANGE_EVENT);
          break;
        case PokemonConstants.SINGLE_POKEMON_RECEIVED:
          resetSinglePokemon(payload.pokemon);
          PokemonStore.changed(POKEMON_DETAIL_CHANGE_EVENT);
          break;
        case PokemonConstants.NEW_POKEMON_CREATED:
          addNewPokemon(payload.pokemon);
          PokemonStore.changed(NEW_POKEMON_CHANGE_EVENT);
          break;
      }
    })
  });

  PokemonStore.fetch();

})();
