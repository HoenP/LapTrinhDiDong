import 'dart:io';

void main() {
  int num = 0;

  // Nhập số nguyên n >= 1
  do {
    stdout.write('Nhap so nguyen n (n >= 1): ');
    String? input = stdin.readLineSync();
    if (input != null) {
      num = int.tryParse(input) ?? 0;
    }
    if (num < 1) {
      print('Vui long nhap lai (n >= 1).');
    }
  } while (num < 1);

  // Tính tổng các ước số của n
  int sum = 0;
  for (int i = 1; i <= num; i++) {
    if (num % i == 0) {
      sum += i;
    }
  }

  // In kết quả
  print('Tong cac uoc so cua $num la: $sum');
}
