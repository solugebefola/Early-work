(function () {
  var Router = ReactRouter.Router;
  var Route = ReactRouter.Route;

  $(document).ready(function() {
    React.render(
      <Router>
        <Route path="/" component={Index}>
          <Route path="pokemon/:pokemonId" component={PokemonDetail} />
          <Route path="pokemon/:pokemonId/toys/:toyId" components={{pokemons: PokemonDetail, toys: ToyDetail}} />
        </Route>
      </Router>,
      document.getElementById("pokedex")
    );
  });
})();
