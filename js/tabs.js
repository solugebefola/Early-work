(function(){
  if (typeof Tabs === "undefined"){
    Tabs = window.Tabs = window.Tabs || {};
  }

  $.Tabs = function (el) {
    this.$el = $(el);
    this.$contentTabs = $(this.$el.data("content-tabs"));
    this.$activeTab = $(this.$contentTabs.find("active"));
    this.$el.on("click","a", function(e){
      e.preventDefault();
      this.clickTab(e.currentTarget);
    }.bind(this));
  };

  $.Tabs.prototype.clickTab = function(target){
    $("ul").children().removeClass("active");
    this.$activeTab.toggleClass("active");
    $(target).toggleClass("active");
    this.$activeTab = this.$contentTabs.find($(target).id);
  }

  $.fn.tabs = function () {
    return this.each(function() {
      new $.Tabs(this);
    });
  };


})();
