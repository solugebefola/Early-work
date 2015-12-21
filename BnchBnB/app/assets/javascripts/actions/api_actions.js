(function(root){
  ApiActions = root.ApiActions = {
    receiveAll: function (benches) {
      AppDispatcher.dispatch({
        actionType: BenchConstants.BENCHES_RECEIVED,
        benches: benches
      });
    },

    receiveBench: function (bench) {
      AppDispatcher.dispatch({
        actionType: BenchConstants.BENCH_RECEIVED,
        bench: bench
      });
    }

  };
})(this);
