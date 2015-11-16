(function (root) {

  FilterParamsActions = root.FilterActions = {
    paramsReceived: function (filterParams) {
      AppDispatcher.dispatch({
        actionType: FilterConstants.FILTER_PARAMS_RECEIVED,
        filterParams: filterParams
      });
    }
  };

})(this);
