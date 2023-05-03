import 'package:flutter/material.dart';

class DataProvider with ChangeNotifier {
  double? _distanta;
  double? _consum;
  double? _pret;

  double? get distanta {
    return _distanta;
  }

  double? get consum {
    return _consum;
  }

  double? get pret {
    return _pret;
  }

  void setDistanta(double distanta) {
    _distanta = distanta;
    notifyListeners();
  }

  void setConsum(double consum) {
    _consum = consum;
    notifyListeners();
  }

  void setPret(double pret) {
    _pret = pret;
    notifyListeners();
  }
}
