(function (root) {
    var _benches = [];

    var resetBenches = function (benches) {
      _benches = benches;
    };

    root.BenchStore = $.extend({}, EventEmitter.prototype, {

      all: function(){
        return _benches.slice(0);
      },

      benchStoreId: AppDispatcher.register(function(payload){
        switch (payload.actionType){
          case BenchConstants.BENCHES_RECEIVED:
            resetBenches(payload.benches);
            break;
        }
      })



    });
})(this);
