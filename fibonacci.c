int fibonacci(int n) {
  int a = 1;
  int b = 1;

  while (n-- > 1) {
    int t = a;
    a = b;
    b += t;
  }

  return b;
}

int fibonacciRec(int num) {
  if (num <= 1) return 1;

  return fibonacciRec(num - 1) + fibonacciRec(num - 2);
}