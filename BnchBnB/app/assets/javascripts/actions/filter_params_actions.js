(function (root) {

  FilterParamsActions = root.FilterActions = {
    paramsReceived: function (filterParams) {
      console.log(filterParams);
      AppDispatcher.dispatch({
        actionType: FilterConstants.FILTER_PARAMS_RECEIVED,
        filterParams: filterParams
      });
    }
  };

})(this);
