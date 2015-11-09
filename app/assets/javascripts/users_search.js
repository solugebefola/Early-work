$.UsersSearch = function (el) {
this.$el = $(el);
this.$input = this.$el.find("#user_name");
this.$ul = this.$el.find("ul");
this.bindEvents();
};

$.UsersSearch.prototype.bindEvents = function () {
  this.$el.on("keyup", "input", this.handleInput.bind(this));
};

$.UsersSearch.prototype.handleInput = function (e) {
  var text = this.$input.val();
  $.ajax({
    url: "/users/search",
    type: "GET",
    dataType: "json",
    data: {
      "query": text
    },
    success: function(returned){
      this.renderResults(returned);
    }.bind(this)
  });
};

$.UsersSearch.prototype.renderResults = function (returned) {
  var users = returned;
  var $userLi;
  var user;
  var followState;
  console.log(users);
  this.$ul.empty();

  for (var i = 0; i < users.length; i++){
    user = users[i];
    followState = user.followed ? "followed" : "unfollowed";
    $userLi = $("<li></li>");
    $userAnchor = $("<a></a>").appendTo($userLi);
    $userAnchor.text(user.username);
    $userAnchor.attr("href", "/users/" + user.id + "/");
    console.log($userLi);
    var $followButton = $("<button></button>").attr("id", user.id);
    $userLi.appendTo(this.$ul).append($followButton);
    $("#" + user.id).followToggle({userId: user.id, followState: followState});
  }
};

$.fn.UsersSearch = function(){
  return this.each(function(){
    new $.UsersSearch(this);
  });
};

$(function (){
  $("div.users-search").UsersSearch();
});
