const Benchmark = require('benchmark');
const loadModule = require('./loader');
const {fiboJs, fiboJsRec} = require('./fibonacci.js');

loadModule('fibonacci.wasm').then(instance => {
  const fiboNative = instance.exports._fibonacci;
  const fiboNativeRec = instance.exports._fibonacciRec;
  
  console.log(fiboJs(5));
  console.log(fiboJsRec(5));
  console.log(fiboNative(5));
  console.log(fiboNativeRec(5));
});