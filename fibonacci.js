function fiboJs(num){
  var a = 1, b = 0, temp;

  while (num >= 0){
    temp = a;
    a = a + b;
    b = temp;
    num--;
  }

  return b;
}

const fiboJsRec = (num) => {
  if (num <= 1) return 1;

  return fiboJsRec(num - 1) + fiboJsRec(num - 2);
}

module.exports = {fiboJs, fiboJsRec};