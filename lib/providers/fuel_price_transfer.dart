import 'package:flutter/material.dart';

class FuelPriceTransfer with ChangeNotifier {
  double? _fuelPrice;

  double? get fuelPrice {
    return _fuelPrice;
  }

  void setFuelPrice(double price) {
    _fuelPrice = price;
    notifyListeners();
  }
}
