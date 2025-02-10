void main() {
  calc(5, 6, '+');
  calc(4, 6, '-');
  calc(5, 6, '*');
  calc(10, 2, '/');
  calc(1, 0, '/');
  calc(6, 12, 'Anwarika');
}

void calc(int a, int b, String op) {
  if (op == '+') {
    print(a + b);
  } else if (op == '-') {
    print(a - b);
  }
  else if (op == '/' && b == 0) {
    print('Error: Division by zero');
  }
  else if (op == '*') {
    print(a * b);
  }
  else if (op == '/') {
    print(a / b);
  }
  else {
    print('Invalid operation');
}
}
