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
  }
};
