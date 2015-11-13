var Map = React.createClass({

  componentDidMount: function () {
    var map = React.findDOMNode(this.refs.map);
    var mapOptions = {
      center: {lat: 37.7758, lng: -122.435},
      zoom: 13
    };
    this.map = new google.maps.Map(map, mapOptions);
    this.map.addListener('idle', this._mapIdle);
    BenchStore.addChangeListener(this._addMarkers);
  },



  render: function () {
    return (
      <div>
        <div className="map" ref="map"></div>
      </div>
    );
  },

  _addMarkers: function () {
    benches = BenchStore.all();
    var markers = [];
    var marker;
    var pos;
    benches.map(function(bench){
      pos = {lat: bench.lat, lng: bench.lng};
      marker = new google.maps.Marker({
        position: pos,
        title: bench.description,
        clickable: true
      });
      marker.setMap(this.map);
      markers.push(marker);
    }.bind(this));
    this.markers = markers;
  },

  _mapIdle: function () {
    var rawBounds = this.map.getBounds();
    var northEast = rawBounds.getNorthEast();
    var southWest = rawBounds.getSouthWest();
    bounds = {bounds: {
      SouthWest: {lat: southWest.lat(), lng: southWest.lng()},
      NorthEast: {lat: northEast.lat(), lng: northEast.lng()}
    }};
    ApiUtil.fetchBenches(bounds);
  }
});
// Google maps api key: AIzaSyA3t2hfUoM68EPV23xoC-0PkyDAaa-2vhY
