ApiUtil = {
  fetchBenches: function() {
    $.ajax({
      url: "api/benches",
      method: "GET",
      dataType: "json",
      success: function(benches){
        ApiActions.receiveAll(benches);
      }
    });
  }
};
