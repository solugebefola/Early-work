(function(){
  if (typeof Tabs === "undefined"){
    Tabs = window.Tabs = window.Tabs || {};
  }

  $.Tabs = function (el) {
    this.$el = $(el);
    this.$contentTabs = $(this.$el.data("content-tabs"));
    this.$activeTab = $(this.$contentTabs.find(".active"));

    this.$el.on("click","a", function(e){
      e.preventDefault();
      this.clickTab(e.currentTarget);
    }.bind(this));
  };

  $.Tabs.prototype.clickTab = function(target){
    // debugger;
    $("ul").find("a").removeClass("active");
    this.$activeTab.addClass("transitioning");
    this.$activeTab.one("transitionend", function(e){
      this.$activeTab.removeClass("active");
      this.$activeTab.removeClass("transitioning");

      this.$activeTab = this.$contentTabs.find($(target).attr("href"));

      this.$activeTab.addClass("active transitioning");
      window.setTimeout(function(){
        this.$activeTab.removeClass("transitioning")
      }.bind(this), 0 );
    }.bind(this));
    $(target).addClass("active");
  }

  $.fn.tabs = function () {
    return this.each(function() {
      new $.Tabs(this);
    });
  };


})();
