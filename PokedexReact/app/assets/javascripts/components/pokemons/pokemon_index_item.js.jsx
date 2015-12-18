(function () {
  window.PokemonIndexItem = React.createClass({
    mixins: [ReactRouter.History],

    render: function () {
      return(
        <li className="poke-list-item">
          <ReactRouter.Link to={"/pokemon/" + this.props.pokemon.id}>
            Name: {this.props.pokemon.name},
            Type: {this.props.pokemon.poke_type}
          </ReactRouter.Link>
        </li>
      );
    }
  });
})();
