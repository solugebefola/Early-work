(function(){
  window.PokemonsIndex = React.createClass ({
    getInitialState: function () {
      return { pokemons: PokemonStore.all() };
    },

    componentDidMount: function () {
      PokemonStore.addPokemonsIndexChangeListener(this._onChange);
      PokemonStore.addNewPokemonChangeListener(this._onChange);
    },

    componentWillUnmount: function () {
      PokemonStore.removePokemonsIndexChangeListener(this._onChange);
      PokemonStore.removeNewPokemonChangeListener(this._onChange);
    },

    _onChange: function () {
      this.setState({ pokemons: PokemonStore.all() });
    },

    render: function () {
      return (
        <ul>
        {
          this.state.pokemons.map(function(pokemon){
            return <PokemonIndexItem pokemon={pokemon} key={pokemon.id}/>;
          })
        }
        </ul>
      );
    }

  });
  })();
