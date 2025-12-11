void main() {
  print(fib(6));
  print(fib(7));
  print(fib(8));
  print(fib(50));
}

int fib(int n, [Map<int, int>? memo]) {
  memo ??= {};
  if (memo[n] != null) return memo[n]!;
  if (n <= 2) return 1;
  memo[n] = fib(n - 1, memo) + fib(n - 2, memo);
  return memo[n]!;
}
