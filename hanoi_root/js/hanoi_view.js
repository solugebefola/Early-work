(function () {
  var Hanoi = window.Hanoi = window.Hanoi || {};
  // if (typeof Hanoi === "undefined") {
  //   window.Hanoi = {};
  // }

  var View = Hanoi.View = function (game, $el) {
    this.game = game;
    this.$el = $el;
    this.selectedTower = null;
    this.setupTowers();
    this.render();
  };

  View.prototype.setupTowers = function () {
    var header = "<h1>Towers of Hanoi bro</h1>"
    var html = "<ul><li></li><li></li><li></li></ul>";
    this.$el.append(header);
    this.$el.append(html);
    this.$el.append(html);
    this.$el.append(html);
    for ( var i = 0; i < 3; i++){
      $($("ul")[i]).addClass("Tower" + i);
    }
  };

  View.prototype.render = function () {
    $("li").removeClass();

    var sizeMatchToNumber = {
      1: "small",
      2: "medium",
      3: "big"
    };

    for ( var i = 0; i < 3; i++){
      var currentTower = this.game.towers[i];

      for( var j = 0; j < currentTower.length; j++){
        var disc = currentTower[j];
        var discClass = sizeMatchToNumber[disc];
        $($(".Tower"+i).children()[j]).addClass(discClass);
        // $($(".Tower"+i).children()[currentTower.length - j - 1]).addClass(discClass);
      }
    }
  };

  View.prototype.clickTower = function ($tower) {
    var currentTowerIdx = parseInt($tower.attr("class").slice(5,6));
    if (this.selectedTower !== null || this.selectedTower === currentTowerIdx ) {
      this.game.move(this.selectedTower, currentTowerIdx);

      this.selectedTower = null;
      $("ul").removeClass("clickedTower");
    } else{
      this.selectedTower = currentTowerIdx;
      $tower.addClass("clickedTower");
    }

    this.render();
  };

})();
