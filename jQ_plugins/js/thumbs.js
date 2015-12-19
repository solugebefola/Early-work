(function(){
  if(typeof Thumbnails === "undefined"){
    Thumbnails = window.Thumbnails = window.Thumbnails || {};
  }

  $.Thumbnails = function (el){
    this.$el = $(el);

  }

  $.Thumbnails.prototype.activate($img){
    var $imgClone = $img.clone();
    this.$el.find("active").append($imgClone);
  }
});
