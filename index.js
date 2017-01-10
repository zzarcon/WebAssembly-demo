const Benchmark = require('benchmark');
const loadModule = require('./loader');
const {fiboJs, fiboJsRec, fiboJsMemo} = require('./fibo.js');
const suite = new Benchmark.Suite;
const numToFibo = 50;

window.Benchmark = Benchmark; //Benchmark.js uses the global object internally

console.info('Benchmark started');

loadModule('fibonacci.wasm').then(instance => {
  const fiboNative = instance.exports._fibonacci;
  const fiboNativeRec = instance.exports._fibonacciRec;
  const fiboNativeMemo = instance.exports._fibonacciMemo;

  suite
  .add('Fibo js', () => fiboJs(numToFibo))
  .add('Fibo js recursive', () => fiboJsRec(numToFibo))
  .add('Fibo js memoization', () => fiboJsMemo(numToFibo))
  .add('Fibo native', () => fiboNative(numToFibo))
  .add('Fibo native recursive', () => fiboNativeRec(numToFibo))
  .add('Fibo native memoization', () => fiboNativeMemo(numToFibo))
  .on('cycle', (event) => console.log(String(event.target)))
  .on('complete', function() {
    console.log('Fastest: ' + this.filter('fastest').map('name'));
    console.log('Slowest: ' + this.filter('slowest').map('name'));
    console.info('Benchmark finished');
  })
  .run({ 'async': true });
});