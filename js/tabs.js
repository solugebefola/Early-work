(function(){
  if (typeof Tabs === "undefined"){
    Tabs = window.Tabs = window.Tabs || {};
  }

  $.Tabs = function (el) {

  };

  $.fn.tabs = function () {
    return this.each(function() {
      new $.Tabs(this);
    });
  };

  
});
