import 'dienthoai.dart';
import 'hoadon.dart';

class CuaHang {
  String _tenCuaHang;
  String _diaChi;
  List<Dienthoai> _danhSachDienThoai = [];
  List<Hoadon> _danhSachHoaDon = [];

  // Constructor
  CuaHang(this._tenCuaHang, this._diaChi);
  //Getter
  String get tenCuaHang => _tenCuaHang;
  String get diaChi => _diaChi;
  //Setter
  set tenCuaHang(String tenCuaHang) {
    _tenCuaHang = (tenCuaHang.isNotEmpty) ? tenCuaHang : _tenCuaHang;
  }

  set diaChi(String diaChi) {
    _diaChi = (diaChi.isNotEmpty) ? diaChi : _diaChi;
  }

//methods
  // Phương thức thêm điện thoại mới
  void themDienThoai(Dienthoai dt) {
    try {
      // Kiểm tra thông tin
      if (dt.maDT.isEmpty)
        throw Exception("Mã điện thoại không được để trống.");
      if (dt.hangSX.isEmpty) throw Exception("Tên hang không được để trống.");
      if (dt.tenDT.isEmpty)
        throw Exception("Tên điện thoại không được để trống.");
      if (dt.giaNhap <= 0) throw Exception("Giá nhập phải lớn hơn 0.");
      if (dt.giaBan <= dt.giaNhap)
        throw Exception("Giá bán phải lớn hơn giá nhập.");
      if (dt.slTon < 0) throw Exception("Số lượng tồn kho không được âm.");

      // Thêm điện thoại nếu hợp lệ
      _danhSachDienThoai.add(dt);
      print("Thêm điện thoại thành công!");
    } catch (e) {
      print("Lỗi: $e");
    }
  }

  void capNhatDienThoai(String maDT, String tenMoi, String hangMoi,
      double giaNhapMoi, double giaBanMoi) {
    try {
      // Tìm điện thoại theo mã
      Dienthoai? dt = _danhSachDienThoai.firstWhere((d) => d.maDT == maDT,
          orElse: () =>
              throw Exception("Không tìm thấy điện thoại mã: $maDT."));

      // Kiểm tra ràng buộc
      if (tenMoi.isEmpty) {
        throw Exception("Khong dien thoai duoc de trong");
      }
      if (hangMoi.isEmpty) throw Exception("Tên hang không được để trống.");
      if (giaNhapMoi <= 0) throw Exception("Giá nhập phải lớn hơn 0.");
      if (giaBanMoi <= giaNhapMoi) {
        throw Exception("Giá bán phải lớn hơn giá nhập.");
      }

      // Cập nhật thông tin
      dt.tenDT = tenMoi;
      dt.hangSX = hangMoi;
      dt.giaNhap = giaNhapMoi;
      dt.giaBan = giaBanMoi;
      print("Cập nhật thông tin thành công cho mã: $maDT");
    } catch (e) {
      print("Lỗi: $e");
    }
  }

  void ngungKinhDoanh(String maDT) {
    for (var dt in _danhSachDienThoai) {
      if (dt.maDT == maDT) {
        dt.trangThai = false;
        print("Điện thoại mã $maDT đã được ngừng kinh doanh.");
        return;
      }
    }
    print("Không tìm thấy điện thoại với mã: $maDT");
  }

  List<Dienthoai> timKiemDienThoai(
      {String? maDT, String? tenDT, String? hangSX}) {
    return _danhSachDienThoai.where((dt) {
      return (maDT != null && dt.maDT.contains(maDT)) ||
          (tenDT != null && dt.tenDT.contains(tenDT)) ||
          (hangSX != null && dt.hangSX.contains(hangSX));
    }).toList();
  }

  void hienThiDanhSachDienThoai() {
    if (_danhSachDienThoai.isEmpty) {
      print("Danh sách điện thoại trống.");
    } else {
      print("Danh sách điện thoại:");
      for (var dt in _danhSachDienThoai) {
        print('\n');
        dt.HienThi();
      }
    }
  }

  void taoHoaDon(Hoadon hd) {
    try {
      // Tìm điện thoại theo mã
      Dienthoai? dt = _danhSachDienThoai.firstWhere((d) => d.maDT == hd.DT,
          orElse: () =>
              throw Exception("Không tìm thấy điện thoại mã: ${hd.DT}."));

      // Kiểm tra tồn kho
      if (hd.slMua > dt.slTon) {
        throw Exception(
            "Không đủ tồn kho. Còn lại ${dt.slTon}, cần ${hd.slMua}.");
      }

      // Cập nhật tồn kho và thêm hóa đơn
      dt.slTon -= hd.slMua;
      _danhSachHoaDon.add(hd);
      print("Hóa đơn ${hd.maHD} được tạo thành công!");
    } catch (e) {
      print("Lỗi: $e");
    }
  }

  List<Hoadon> timKiemHoaDon({String? maHD, String? tenKH, DateTime? ngayBan}) {
    return _danhSachHoaDon.where((hd) {
      return (maHD != null && hd.maHD.contains(maHD)) ||
          (tenKH != null && hd.tenKH.contains(tenKH)) ||
          (ngayBan != null && hd.ngayBan.isAtSameMomentAs(ngayBan));
    }).toList();
  }

  void hienThiDanhSachHoaDon() {
    if (_danhSachHoaDon.isEmpty) {
      print("\nDanh sách hóa đơn trống.");
    } else {
      print("\nDanh sách hóa đơn:");
      for (var hd in _danhSachHoaDon) {
        print('\n');
        hd.hienThiThongTin();
      }
    }
  }

// Phương thức thống kê tổng doanh thu theo khoảng thời gian
  double tinhTongDoanhThu(DateTime tuNgay, DateTime denNgay) {
    return _danhSachHoaDon
        .where(
            (hd) => hd.ngayBan.isAfter(tuNgay) && hd.ngayBan.isBefore(denNgay))
        .fold(0, (tong, hd) => tong + hd.tinhTongTien());
  }

  // Phương thức tính tổng lợi nhuận theo khoảng thời gian
  double tinhTongLoiNhuan(DateTime tuNgay, DateTime denNgay) {
    return _danhSachHoaDon
        .where(
            (hd) => hd.ngayBan.isAfter(tuNgay) && hd.ngayBan.isBefore(denNgay))
        .fold(0, (tong, hd) => tong + hd.tinhLoiNhuan());
  }

// Phương thức thống kê top điện thoại bán chạy
  List<Dienthoai> thongKeBanChay(int soLuong) {
    _danhSachDienThoai.sort((a, b) => b.slTon.compareTo(a.slTon));
    return _danhSachDienThoai.take(soLuong).toList();
  }

// Phương thức thống kê tồn kho
  void thongKeTonKho() {
    print("\nThống kê tồn kho:");
    for (var dt in _danhSachDienThoai) {
      print("${dt.tenDT} - Tồn kho: ${dt.slTon}");
    }
  }
}
