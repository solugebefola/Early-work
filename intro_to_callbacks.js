function Clock () {
  this.currentTime = new Date();
}

Clock.TICK = 5000;

Clock.prototype.printTime = function () {
  // Format the time in HH:MM:SS
  console.log(this.currentTime.getHours() + ":" +
              this.currentTime.getMinutes() + ":" +
              this.currentTime.getSeconds());
};

Clock.prototype.run = function () {
  this.printTime();
  setInterval(this._tick.bind(this), Clock.TICK);
  // setInterval(this.printTime(currentTime), Clock.TICK);
  // 1. Set the currentTime.
  // 2. Call printTime.
  // 3. Schedule the tick interval.
};

Clock.prototype._tick = function () {
  this.currentTime.setTime(this.currentTime.getTime() + Clock.TICK);
  this.printTime();
  // 1. Increment the currentTime.
  // 2. Call printTime.
};
//
// var clock = new Clock();
// clock.run();

// var readline = require('readline');
// var reader = readline.createInterface({
//   input: process.stdin,
//   output: process.stdout
// });

function addNumbers(sum, numsLeft, completionCallback) {
  if (numsLeft > 0) {
    reader.question("Enter a number:", function(numString){
      var num = parseInt(numString);
      sum += num;
      console.log(sum);
      numsLeft -= 1;
      addNumbers(sum, numsLeft, completionCallback);
    })
  } else {
    completionCallback(sum);

  }
};
//
// addNumbers(0, 3, function (sum) {
//   console.log("Total Sum: " + sum);
//     reader.close();
// });

var readline = require("readline");

var reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

function askIfGreaterThan(el1, el2, callback) {
  // Prompt user to tell us whether el1 > el2; pass true back to the
  // callback if true; else false.
  reader.question("Is " + el1 + " greater than " + el2 + "?", function(answer) {
    if(answer.toLowerCase() === "yes") {
      callback(true);
    } else {
      callback(false);
    }
  });
};

function innerBubbleSortLoop(arr, i, madeAnySwaps, outerBubbleSortLoop) {
  // Do an "async loop":
  if (i === arr.length - 1){
    outerBubbleSortLoop(madeAnySwaps);
  } else {
    askIfGreaterThan(arr[i], arr[i + 1],
      function(isGreaterThan) {
        if(isGreaterThan){
          var temp = arr[i];
          arr[i] = arr[i + 1];
          arr[i + 1] = temp;
          madeAnySwaps = true;
        }
        innerBubbleSortLoop(arr, i+1, madeAnySwaps, outerBubbleSortLoop);
      });
    };
  };
  // 1. If (i == arr.length - 1), call outerBubbleSortLoop, letting it
  //    know whether any swap was made.
  // 2. Else, use `askIfGreaterThan` to compare `arr[i]` and `arr[i +
  //    1]`. Swap if necessary. Call `innerBubbleSortLoop` again to
  //    continue the inner loop. You'll want to increment i for the
  //    next call, and possibly switch madeAnySwaps if you did swap.

function absurdBubbleSort(arr, sortCompletionCallback) {
  var madeAnySwaps = true;
  outerBubbleSortLoop(madeAnySwaps);

  function outerBubbleSortLoop(madeAnySwaps) {
    if (madeAnySwaps){
      madeAnySwaps = false;
      innerBubbleSortLoop(arr, 0, madeAnySwaps, outerBubbleSortLoop);
    } else {
      sortCompletionCallback(arr);
    };
    // Begin an inner loop if `madeAnySwaps` is true, else call
    // `sortCompletionCallback`.
  }

  // Kick the first outer loop off, starting `madeAnySwaps` as true.
}

absurdBubbleSort([3, 2, 1], function (arr) {
  console.log("Sorted array: " + JSON.stringify(arr));
  reader.close();
});
