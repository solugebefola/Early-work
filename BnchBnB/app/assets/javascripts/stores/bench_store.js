(function (root) {
  var _benches = [];
  var CHANGE_EVENT = "change";

  var resetBenches = function (benches) {
    _benches = benches;
    BenchStore.changed();
  };

  var addBench = function (bench) {
    _benches.push(bench);
    BenchStore.changed();
  };

  root.BenchStore = $.extend({}, EventEmitter.prototype, {

    all: function(){
      return _benches.slice(0);
    },

    addChangeListener: function (callback) {
      this.on(CHANGE_EVENT, callback);
    },

    removeChangeListener: function (callback) {
      this.removeListener(CHANGE_EVENT, callback);
    },

    changed: function () {
      this.emit(CHANGE_EVENT);
    },

    dispatcherID: AppDispatcher.register(function(payload){
      switch (payload.actionType){
        case BenchConstants.BENCHES_RECEIVED:
          resetBenches(payload.benches);
          break;
        case BenchConstants.BENCH_RECEIVED:
          addBench(payload.bench);
          break;
      }
    })



  });
})(this);
