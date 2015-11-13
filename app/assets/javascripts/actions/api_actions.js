(function(root){
  ApiActions = root.ApiActions = {
    receiveAll: function (benches) {
      AppDispatcher.dispatch({
        actionType: BenchConstants.BENCHES_RECEIVED,
        benches: benches
      });
    }
  };
})(this);
