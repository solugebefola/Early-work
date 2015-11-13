(function(root){
  ApiActions = root.ApiActions = {
    receiveAll: function (benches) {
      AppDispatcher.dispatch({
        actionType: BENCHES_RECEIVED,
        benches: benches
      });
    }
  };
})(this);
