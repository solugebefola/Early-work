(function(){
  if (typeof Carousel === "undefined"){
    Carousel = window.Carousel = window.Carousel || {};
  }

//Pass in carousel class
$.Carousel = function(el){
  this.$el = $(el);
  this.activeIdx = 0;
  this.$listItems = this.$el.find(".items").children();
  var slideLeft = $(document).find(".slide-left");
  var slideRight =$(document).find(".slide-right");
  $(this.$listItems[0]).addClass("active");

  slideLeft.on("click", function(e){
    this.slide(1);
  }.bind(this));

  slideRight.on("click", function(e){
    this.slide(-1);
  }.bind(this));

}

$.Carousel.prototype.slide = function(dir){
  $(this.$listItems[this.activeIdx]).removeClass("active right left");

  this.activeIdx = (this.activeIdx + dir + this.$listItems.length) % this.$listItems.length;

  if(dir < 0){
    $(this.$listItems[this.activeIdx]).addClass("right");
  }else{
    $(this.$listItems[this.activeIdx]).addClass("left");
  }
  $(this.$listItems[this.activeIdx]).addClass("active");

    window.setTimeout(function(){
      $(this.$listItems[this.activeIdx]).removeClass("right left");
    }.bind(this), 0);
};

$.fn.carousel = function () {
  return this.each(function() {
    new $.Carousel(this);
  });
};

})();
