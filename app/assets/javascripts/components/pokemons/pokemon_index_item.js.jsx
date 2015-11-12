(function () {
  window.PokemonIndexItem = React.createClass({
    mixins: [ReactRouter.History],

    showDetail: function (e) {
      e.preventDefault();

      this.history.pushState(null, "/pokemon/" + this.props.pokemon.id);

    },

    render: function () {
      return(
        <li className="poke-list-item" onClick={this.showDetail}>
          Name: {this.props.pokemon.name},
          Type: {this.props.pokemon.poke_type}
        </li>
      );
    }
  });
})();
