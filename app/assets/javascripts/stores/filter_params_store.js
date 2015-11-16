(function (root) {
  _filterParams = {bounds: {}, maxSeating: 10, minSeating: 0};
  var CHANGE_EVENT = "filter_change";
  var resetFilterParams = function (newParams) {
    for(var key in newParams){
      _filterParams[key] = newParams[key];
    }
  };

  FilterParamsStore = root.FilterParamsStore = $.extend({}, EventEmitter.prototype, {

    all: function () {
      var paramsClone = {};
      for(var key in _filterParams){
        paramsClone[key] = _filterParams[key];
      }
      return paramsClone;
    },

    addChangeListener: function (callback) {
      this.on(CHANGE_EVENT, callback);
    },

    removeChangeListener: function (callback) {
      this.removeListener(callback);
    },

    changed: function () {
      this.emit(CHANGE_EVENT);
    },

    dispatcherID: AppDispatcher.register(function(payload){
      switch (payload.actionType){
        case FilterConstants.FILTER_PARAMS_RECEIVED:
          resetFilterParams(payload.filterParams);
          FilterParamsStore.changed();
          break;
      }
    })


  });
})(this);
