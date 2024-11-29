import 'dienthoai.dart';

class Hoadon {
  String _maHD;
  DateTime _ngayBan;
  int _slMua;
  double _giaBanThucTe;
  String _tenKH;
  String _DT;
  Dienthoai _dienthoai;

  // Constructor
  Hoadon(this._maHD, this._ngayBan, this._slMua, this._giaBanThucTe,
      this._tenKH, this._DT, this._dienthoai);

  // Getters
  String get maHD => _maHD;
  DateTime get ngayBan => _ngayBan;
  int get slMua => _slMua;
  double get giaBanThucTe => _giaBanThucTe;
  String get tenKH => _tenKH;
  String get DT => _DT;

  // Setters
  set maHD(String maHD) {
    _maHD = (maHD.isNotEmpty && maHD.startsWith('HD-')) ? maHD : _maHD;
  }

  set ngayBan(DateTime ngayBan) {
    _ngayBan = (ngayBan.isBefore(DateTime.now())) ? ngayBan : _ngayBan;
  }

  set slMua(int slMua) {
    _slMua = (slMua > 0) ? slMua : _slMua;
  }

  set giaBanThucTe(double giaBanThucTe) {
    _giaBanThucTe = (giaBanThucTe > 0) ? giaBanThucTe : _giaBanThucTe;
  }

  set tenKH(String tenKH) {
    _tenKH = (tenKH.isNotEmpty) ? tenKH : _tenKH;
  }

  set DT(String DT) {
    _DT = (DT.isNotEmpty && DT.length >= 10 && isNumeric(DT)) ? DT : _DT;
  }

  //methods
  bool isNumeric(String dt) {
    return RegExp(r'^[0-9]+$').hasMatch(dt);
  }

  // Phương thức tính tổng tiền
  double tinhTongTien() {
    return _slMua * _giaBanThucTe;
  }

  double tinhLoiNhuan() {
    return tinhTongTien() - (_slMua * _dienthoai.giaNhap);
  }

  void hienThiThongTin() {
    print("Mã hóa đơn: $_maHD");
    print("Ngày bán: $_ngayBan");
    print("Số lượng mua: $_slMua");
    print("Giá bán thực tế: $_giaBanThucTe");
    print("Tên khách hàng: $_tenKH");
    print("Số điện thoại: $_DT");
    print("Tổng tiền: ${tinhTongTien()}");
    print("Lợi nhuận: ${tinhLoiNhuan()}");
  }
}
