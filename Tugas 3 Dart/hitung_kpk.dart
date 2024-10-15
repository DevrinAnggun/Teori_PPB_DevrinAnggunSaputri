void main() {
  int num1 = 12;
  int num2 = 8;
  int kpk = hitungKPK(num1, num2);
  print('Bilangan 1: $num1');
  print('Bilangan 2: $num2');
  print('KPK $num1 dan $num2 = $kpk');
}

int hitungKPK(int a, int b) {
  return (a * b) ~/ hitungFPB(a, b);
}

int hitungFPB(int a, int b) {
  while (b != 0) {
    int temp = b;
    b = a % b;
    a = temp;
  }
  return a;
}
