var Autocomplete = React.createClass({

  getInitialState: function () {
    return ({ text: "" });
  },

  handleInput: function (e) {
    e.preventDefault();
    this.setState({text: e.target.value});
  },

  handleClick: function (e) {
    e.preventDefault();
    this.setState({text: e.target.textContent});
  },


  render: function () {
    var matchedNames = [];
    var matcher = new RegExp("^" + this.state.text)
    this.props.names.forEach ( function (el) {
      if (el.match(matcher)) {
        matchedNames.push(
          <li onClick={ this.handleClick }>{el}</li>
        );
      }
    });


    return (
      <div>
        <input type="text" onInput={ this.handleInput } value={ this.state.text } className="autovalue" />

        <ul onClick={ this.handleClick }>
          { matchedNames }
        </ul>
      </div>
    );
  }
});

var ClockWidget = React.createClass({

  getInitialState: function () {
    return ({ currentTime: new Date() });
  },

  componentDidMount: function () {
    this.clockUpdate = setInterval(this.intervalTime, 1000);
  },

  componentWillUnmount: function () {
    window.clearInterval(this.clockUpdate);
  },

  intervalTime: function () {
    this.setState({ currentTime: new Date() });
  },

  render: function () {
    return (
      <div>
        <p>{ this.state.currentTime.toString() }</p>
      </div>
    )
  }

});

var WeatherWidget = React.createClass({

  getInitialState: function () {
    return ({ currentWeather: "", currentTemp: "" })
  },

  getLocation: function () {
    this.geo = navigator.geolocation;
    var long;
    var lat;
    var appId = "605dca5991340422d6b04dfc2e1b34fd";

    this.geo.getCurrentPosition(function (position) {
      long = position.coords.longitude;
      lat = position.coords.latitude;
      var site = "http://api.openweathermap.org/data/2.5/weather?";
      var url = site + "lat=" + lat + "&lon=" + long + "&appid=" + appId;


      var xhr = new XMLHttpRequest();

      xhr.open(
        'GET',
        url,
        true);

      xhr.send();


      xhr.onreadystatechange = function () {
        if (xhr.readyState === XMLHttpRequest.DONE) {
          var weather = JSON.parse(xhr.responseText);

          this.setState({ currentWeather: weather["weather"][0]["main"] });
          this.setState({ currentTemp: weather["main"]["temp"] });

        } else {}
      }.bind(this);
    }.bind(this));
  },

  componentDidMount: function () {
    this.getLocation();
  },


  render: function () {
    return (
      <div>
        <p>weather: { this.state.currentWeather }</p>
        <p>temperature: { this.state.currentTemp }</p>
      </div>
    )
  }
});


var Tabs = React.createClass({

  getInitialState: function () {
    return ({activeIndex: 0});
  },

  handleClick: function (e) {
    e.preventDefault();
    this.setState({ activeIndex: parseInt(e.target.id) })
  },

  render: function () {
    var headers = [];

    for (var i = 0; i < this.props.items.length ; i++) {
      var isActive = ( this.state.activeIndex === i ? "active" : "" );

      var header = <li id={i} className={isActive}>
                      {this.props.items[i].header}
                  </li>;
                  debugger
      if (isActive === "active") {
        header = <strong>{header}</strong>;
      }
      headers.push(header);
    }

    return(
      <div>
        <ul onClick={ this.handleClick }>
        { headers }
        </ul>
        <span>
          { this.props.items[this.state.activeIndex].content }
        </span>
      </div>
    );
  }

});
