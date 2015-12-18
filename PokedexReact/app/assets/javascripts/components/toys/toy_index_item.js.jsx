(function () {
  window.ToyIndexItem = React.createClass({
    mixins: [ReactRouter.History],

    getToyDetail: function (e) {
      e.preventDefault();
      this.history.pushState(null, "pokemon/" + this.props.toy.pokemon_id + "/toys/" + this.props.toy.id);
    },

    render: function () {
      return(
        <li onClick={this.getToyDetail} className="toy-list-item">
          <ul>
            <li key="name">Name: {this.props.toy.name} </li>
            <li key="happiness">Happiness: {this.props.toy.happiness} </li>
            <li key="price">Price: {this.props.toy.price} </li>
          </ul>
        </li>
      );
    }
  });
})();
