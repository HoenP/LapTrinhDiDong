import 'dart:io';

void main() {
  int num = 0;

  // Nhập số nguyên n >= 1
  do {
    stdout.write('Nhap so nguyen (n >= 1): ');
    String? input = stdin.readLineSync();
    if (input != null) {
      num = int.tryParse(input) ?? 0;
    }
    if (num < 1) {
      print('Vui long nhap lai (n >= 1).');
    }
  } while (num < 1);

  // Hàm chuyển đổi thập phân sang nhị phân
  String convertToBinary(int number) {
    if (number == 0) return '0';

    String binary = '';
    while (number > 0) {
      int remainder = number % 2;
      binary = remainder.toString() + binary;
      number = number ~/ 2;
    }
    return binary;
  }

  // Sử dụng hàm tự xây dựng để chuyển đổi
  String binary = convertToBinary(num);

  // In kết quả
  print('So $num duoi dang nhi phan la: $binary');
}
