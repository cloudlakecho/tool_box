/* 
  problems from Great Front End 75
  from May 2025
*/

/* Debounce */

export default function debounce(func, wait) {
  while (i < wait) {
    func(); 
  }
}

/* Array.prototype.redue */


Array.prototype.myReduce = function (callbackFn, initialValue) {
  let result = 0;
  for (let i; i< this.length; i++) {
    result += this[i];
  }
  result += initialValue;
}

[1, 2, 3].myReduce((prev, curr) => prev + curr, 0); // 6
[1, 2, 3].myReduce((prev, curr) => prev + curr, 4); // 10
