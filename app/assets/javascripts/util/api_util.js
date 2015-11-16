var ApiUtil = {
  fetchBenches: function(bounds) {
    $.ajax({
      url: "api/benches/",
      method: "GET",
      data: bounds,
      dataType: "json",
      success: function(benches){
        ApiActions.receiveAll(benches);
      }
    });
  },

  createBench: function(newBench) {
    $.ajax({
      url: "api/benches/",
      method: "POST",
      data: {bench: newBench},
      dataType: "json",
      success: function(bench) {
        ApiActions.receiveBench(bench);
      }
    });
  }
};
