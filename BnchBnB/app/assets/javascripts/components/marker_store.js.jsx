  // var _markers = [];
  //     _markerBenchPairs = {};
  //
  // MarkerStore = root.MarkerStore = $.extend({}, EventEmitter.prototype, {
  //     all: function () {
  //       return _markerBenchPairs.slice(0);
  //     },
  //
  //     resetMarkersToNull: function () {
  //       var tempmarker;
  //       for(var marker in _markerBenchPairs){
  //         marker.setMap(null);
  //       }
  //     },
  //
  //     addChangeListener: function (callback) {
  //       this.on(CHANGE_EVENT, callback);
  //     },
  //
  //     removeChangeListener: function (callback) {
  //       this.removeListener(CHANGE_EVENT, callback);
  //     },
  //
  //     changed: function () {
  //       this.emit(CHANGE_EVENT);
  //     },
  //
  //     dispatcherID: AppDispatcher.register(function (payload) {
  //       switch (payload.actionType){
  //         case BenchConstants.BENCHES_RECEIVED:
  //           // AppDispatcher.waitFor(BenchStore.dispatcherID);
  //           resetMarkers(payload.benches);
  //           break;
  //
  //       }
  //     }),
  //
  // });
  //
