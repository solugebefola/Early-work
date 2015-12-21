var ApiUtil = {
  fetchBenches: function(filterParams) {
    $.ajax({
      url: "api/benches/",
      method: "GET",
      data: {filterParams: filterParams},
      dataType: "json",
      success: function(benches){
        ApiActions.receiveAll(benches);
      },
      error: function (error) {
        console.log(error);
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
