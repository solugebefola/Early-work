ApiUtil = {
  fetchBenches: function() {
    $.ajax({
      url: "/benches",
      type: "GET",
      dataType: "json",
      success: function(benches){
        ApiAction.receiveAll(benches);
      }
    });
  }
};
