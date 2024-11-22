void main() {
  int a, b;

  a = 0;
  b = ++a;
  assert(a == b);

  print('a = $a');
  print('b = $b');
}
