import 'package:flutter/material.dart';

class DataProvider with ChangeNotifier {
  int? _distanta;
  int? _consum;
  int? _pret;

  int? get distanta {
    return _distanta;
  }

  int? get consum {
    return _consum;
  }

  int? get pret {
    return _pret;
  }

  void setDistanta(int distanta) {
    _distanta = distanta;
    notifyListeners();
  }

  void setConsum(int consum) {
    _consum = consum;
    notifyListeners();
  }

  void setPret(int pret) {
    _pret = pret;
    notifyListeners();
  }
}
