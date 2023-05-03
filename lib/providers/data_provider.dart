import 'package:flutter/material.dart';

class DataProvider with ChangeNotifier {
  double? _distanta;
  double? _consum;
  double? _pret;
  bool _isGood = false;

  double? get distanta {
    return _distanta;
  }

  double? get consum {
    return _consum;
  }

  double? get pret {
    return _pret;
  }

  bool get goodStatus {
    return _isGood;
  }

  void setDistanta(double distanta) {
    _distanta = distanta;
    print(_distanta);
    notifyListeners();
  }

  void setConsum(double consum) {
    _consum = consum;
    print(_consum);
    notifyListeners();
  }

  void setPret(double pret) {
    _pret = pret;
    print(_pret);
    notifyListeners();
  }

  void setGoodStatus(bool status) {
    _isGood = status;
  }
}
