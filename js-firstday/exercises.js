Array.prototype.uniq = function(){
  var uniques = [];

  for(var i = 0; i < this.length; i++){

    if(uniques.indexOf(this[i]) === -1){
      uniques.push(this[i]);
    }

  }
  return uniques;
};

[1,2,2,3,3,3].uniq();

Array.prototype.twoSum = function() {
  var pairs = [];

  for(var i = 0; i < this.length; i++){
    for(var j = i+1; j < this.length; j++){
      if(this[i] + this[j] === 0){
        pairs.push([i,j]);
      }
    }
  }
  return pairs;
};

[1,-1,2,-2,3].twoSum();

Array.prototype.transpose = function() {
  var newArr = [];
  // _.times(this.length){
  //   newArr.push([])
  // };
  var times = this.length;
  for(var k=0; k < times; k++){
    newArr.push([])
  }
  for(var i = 0; i < this.length; i++){
    var inner = this[i];
    for(j = 0; j < this[i].length; j++){
      newArr[i][j] = this[j][i];
    }
  }
  return newArr;
};

[[1,2,3],[1,2,3],[1,2,3]].transpose();

Array.prototype.myEach = function(f){
  for(var i = 0; i < this.length; i++){
    f(this[i]);
  }
  return this;
};

var printThis = function(thething) {
  console.log(thething);
};
["A","B","c"].myEach(printThis);

Array.prototype.myMap = function(f) {
  var result = []

  this.myEach(function(n){
    result.push(f(n));
  });

  return result;
};

var value = function(n){
  return n+1;
};

Array.prototype.myMap = function(f) {
  var result = [];

  var mapPush = function(n){
    result.push(f(n));
  };

  this.myEach(mapPush);
  return result;
};

[1,2,3,4].myMap(value);

Array.prototype.myInject = function(f, start) {
  var iterarray = this;
  if (start){
    var accumulator = start;
  }
  else{
    var accumulator = this[0];
    iterarray = this.slice(1);
  }

  iterarray.myEach( function(n) {
    accumulator = f(accumulator, n);
  });
  return accumulator;
};

var sum = function(a,b) { return a+b; };

Array.prototype.bubbleSort = function(){
  var switchElement = null;

    for(var i = 0; i < this.length; i++){
      for(var j = 0; j < this.length; j++){
        if(this[j+1] < this[j]){
          switchElement = this[j+1];
          this[j+1] = this[j];
          this[j] = switchElement;
        }
      }
    }

  return this
};

String.prototype.subStrings = function(){
  var subArray = [];
  for(var i = 0; i < this.length; i++){
    for(var j = i+1; j < this.length + 1; j++) {

      if(subArray.indexOf(this.substring(i,j)) == -1){
        subArray.push(this.substring(i,j));

      }
    }
  }
  return subArray;
};

var rangeFunct = function(start, end) {
  var storArray = [];
  var otherArray = [];
  if (end < start){
    return [];
  }
  else{
    storArray = [start].concat(rangeFunct(start + 1, end));
  }
  return storArray;
};

var sum = function(arr){
  var total = 0;
  if(arr.length == 0){
    return 0;
  }
  else{
    total += arr[0] + sum(arr.slice(1));
  }
  return total;
};

var exponentiation = function(b,n){
  if(n == 0){
    return 1;
  }
  else{
    return b*exponentiation(b,n-1);
  }
};

var exponentiation2 = function(b,n){
  if(n==0){
    return 1;
  }
  else if(n==1){
    return b;
  }
  else if(n%2 == 0){
    return exponentiation2(b, n/2) * exponentiation2(b, n/2);
  }
  else{
   return b * exponentiation2(b, (n-1)/2) * exponentiation2(b, (n-1)/2);
  }
};

var fib = function(n){
  var total = [];
  if(n == 0){
    return [];
  }
  else if(n == 1){
    return [1];
  }
  else if(n == 2){
    return [1,1];
  }
  else{
    // console.log(fib(n-2)[-1]);
    var last = fib(n-1)[fib(n-1).length-1]
    var last2 = fib(n-2)[fib(n-2).length-1]

    var lastEl = last + last2;
    console.log(lastEl);
    total = fib(n-1);
    console.log(total);
    total.push(lastEl);
    return total;
  }
};

var binarySearch = function(arr, target){
  var mid = Math.floor(arr.length/2)
  if(arr.length==0){
    return null;
  }
  else if(arr[mid]==target){
    return mid;
  }
  else if(arr[mid]>target){
    if(binarySearch(arr.slice(0,mid),target)==null){
      return null;
    }
    else{
    return binarySearch(arr.slice(0,mid),target);
    }
  }
  else{
    var index = binarySearch(arr.slice(mid,-1),target);
    if(index == null){
      return null;
    }
    else{
      return index + mid;
    }
  }
};

var makeChange2 = function(value, coins){
  var possibilities = [];
  var p = [];
  while(coins.length != 0){
  remainder = value;
  for(var i = 0; i < coins.length; i++){
    while(remainder > coins[i]){
      remainder -= coins[i];
      p.push(coins[i]);
    }
  }
  possibilities.push(p);
  coins = coins.slice(1);
  }
  var best = possibilities[0];
  for(var i = 0; i < possibilities.length; i++){
    if(possibilities[i].length <= best){
      best = possibilities[i];
    }
  }
  console.log(possibilities);
};

var makeChange = function(value, coins) {
  var coins_array = [];
  var best_coins = [];
  if(value == 0 || coins.length == 0){
    return [];
  }
  for(var i = 0; i < coins.length; i++){
    coins = coins.slice(i);

    if (coins[0] <= value){
      var remainder = value - coins[0];
      coins_array.push(coins[0]);
      coins_array = coins_array.concat(makeChange(remainder, coins));
    }
    else{
      var new_coins = coins.slice(1);
      coins_array = coins_array.concat(makeChange(value,new_coins));
    }
    if(best_coins.length == 0 || coins_array.length < best_coins.length){
      best_coins = coins_array;
      coins_array = [];
    }
  }
 return best_coins;
};

var mergeSort = function (arr) {
  if ( arr.length < 2){
    return arr;
  }
  var mid = Math.floor(arr.length/2);
  var left_unsorted = mergeSort(arr.slice(0,mid));
  var right_unsorted = mergeSort(arr.slice(mid));
  var sorted = merge(left_unsorted,right_unsorted);
  return sorted;
};

var merge = function (larr, rarr) {
  var merged = [];
  while (larr.length > 0 && rarr.length > 0){
    if (larr[0] <= rarr[0]){
      merged.push(larr.shift());
    }
    else {
      merged.push(rarr.shift());
    }
  }
  merged = merged.concat(larr);
  merged = merged.concat(rarr);
  return merged;
};

var subsets = function (arr){
  var subs = [];
  if(arr.length == 0){
    return [[]];
  }
  else{
    for(var j = 0; j < arr.length; j++){
      var ardup = arr.slice();
      var lastval = ardup.splice(j,1);
      var arr2 = subsets(ardup)
      for (var i = 0; i < arr2.length; i++){
        arr2[i] = arr2[i].concat(lastval);
      }
      subs = arr2.concat(subsets(ardup))
    }
  }
  return subs;
};
