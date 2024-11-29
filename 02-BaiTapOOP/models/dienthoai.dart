class Dienthoai {
  String _maDT;
  String _tenDT;
  String _hangSX;
  double _giaNhap;
  double _giaBan;
  int _slTon;
  bool _trangThai;

  // Constructor
  Dienthoai(this._maDT, this._tenDT, this._hangSX, this._giaNhap, this._giaBan,
      this._slTon, this._trangThai);

  //getter
  String get maDT => _maDT;
  String get tenDT => _tenDT;
  String get hangSX => _hangSX;
  double get giaNhap => _giaNhap;
  double get giaBan => _giaBan;
  int get slTon => _slTon;
  bool get trangThai => _trangThai;

  //setter
  set maDT(String maDT) {
    _maDT = (maDT.isNotEmpty && maDT.startsWith('DT-')) ? maDT : _maDT;
  }

  set tenDT(String tenDT) {
    _tenDT = (tenDT.isNotEmpty) ? tenDT : _tenDT;
  }

  set hangSX(String hangSX) {
    _hangSX = (hangSX.isNotEmpty) ? hangSX : _hangSX;
  }

  set giaNhap(double giaNhap) {
    _giaNhap = (giaNhap > 0) ? giaNhap : _giaNhap;
  }

  set giaBan(double giaBan) {
    _giaBan = (giaBan > 0 && giaBan > giaNhap) ? giaBan : _giaBan;
  }

  set slTon(int slTon) {
    _slTon = (slTon >= 0) ? slTon : _slTon;
  }

  set trangThai(bool trangThai) {
    _trangThai = trangThai;
  }

  //methods
  double loiNhuanDuKien() {
    return (giaBan - giaNhap) * slTon;
  }

  void HienThi() {
    print('Ma DT: $maDT');
    print('Ten DT: $tenDT');
    print('hang SX: $hangSX');
    print('gia nhap: $giaNhap');
    print('gia ban: $giaBan');
    print('sl ton: $slTon');
    print('trang thai: ${trangThai ? 'con kinh doanh' : 'Ngung Ban'}');

    print('loi nhuan du kien: ${loiNhuanDuKien()}');
  }

  bool checkHang() {
    if (slTon > 0 && trangThai) {
      return true;
    }
    return false;
  }
}
