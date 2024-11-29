import '../models/cuahang.dart';
import '../models/hoadon.dart';
import '../models/dienthoai.dart';

void main() {
  CuaHang cuaHang = CuaHang("Cửa Hàng A", "123 Đường ABC");

  // Thêm điện thoại mới
  Dienthoai dt1 =
      Dienthoai("DT-001", "iPhone 14", "Apple", 15000000, 20000000, 50, true);
  cuaHang.themDienThoai(dt1);
  Dienthoai dt2 = Dienthoai(
      "DT-002", "Galaxy S23", "Samsung", 12000000, 18000000, 30, true);
  cuaHang.themDienThoai(dt2);

  // Hiển thị danh sách điện thoại
  cuaHang.hienThiDanhSachDienThoai();

  print('\nHien Thi Loi');
  // Cập nhật thông tin điện thoại

  // cuaHang.capNhatDienThoai(
  //     "DT-001", "iPhone 14 Pro", "Apple", 16000000, 21000000);
  // cuaHang.hienThiDanhSachDienThoai();

  //Kiểm tra validation
  cuaHang.capNhatDienThoai("DT-001", "", "Apple", 1000, 1100);
  cuaHang.hienThiDanhSachDienThoai();

  // Tạo hóa đơn hợp lệ
  Hoadon hd1 = Hoadon(
      "HD-001", DateTime.now(), 5, 20000000, "Nguyen Van B", "DT-001", dt1);
  cuaHang.taoHoaDon(hd1);

  // Tạo hóa đơn không hợp lệ (tồn kho không đủ)
  Hoadon hd2 = Hoadon(
      "HD-002", DateTime.now(), 100, 20000000, "Nguyen Van C", "DT-001", dt1);
  cuaHang.taoHoaDon(hd2);

  // Hiển thị danh sách hóa đơn
  cuaHang.hienThiDanhSachHoaDon();

  print('\n');
  // Tính toán tiền và lợi nhuận
  double doanhThuHoaDon1 = hd1.tinhTongTien();
  double loiNhuanHoaDon1 = hd1.tinhLoiNhuan();
  print("Doanh thu hóa đơn HD-001: $doanhThuHoaDon1");
  print("Lợi nhuận hóa đơn HD-001: $loiNhuanHoaDon1");

  // Tính doanh thu theo thời gian
  double doanhThu =
      cuaHang.tinhTongDoanhThu(DateTime(2023, 1, 1), DateTime(2024, 12, 31));
  print("Tổng doanh thu từ 2023 đến 2024: $doanhThu");

  // Tính lợi nhuận theo thời gian
  double loiNhuan =
      cuaHang.tinhTongLoiNhuan(DateTime(2023, 1, 1), DateTime(2024, 12, 31));
  print("Tổng lợi nhuận từ 2023 đến 2024: $loiNhuan");

  // Thống kê top bán chạy
  List<Dienthoai> topBanChay = cuaHang.thongKeBanChay(2);
  print("Top 2 điện thoại bán chạy:");
  for (var dt in topBanChay) {
    print("${dt.tenDT} - Tồn kho: ${dt.slTon}");
  }

  // Báo cáo tồn kho
  cuaHang.thongKeTonKho();
}
