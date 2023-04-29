import 'package:html/parser.dart' as parser;
import 'package:http/http.dart' as http;

import 'package:html/dom.dart' as html;

import 'package:flutter/material.dart';

class FuelProvider with ChangeNotifier {
  List<String> _globalSupplierName = [];
  List<String> _globalFuelName = [];
  List<String> _globalFuelPrice = [];
  Map<String, List<String>> _benzinaFuelListChild = {};
  Map<String, List<String>> _fuelListChild = {};

  Map<String, List<String>> get fuelData {
    return _fuelListChild;
  }

  Future<void> getFirstSiteInfo() async {
    List<String> supplierName = [];
    List<String> fuelName = [];
    List<String> fuelPrice = [];
    int cellCounter = 0;
    int supplierCounter = -1;
    int fuelNameCounter = -1;
    int fuelPriceCounter = -1;

    Uri url = await Uri.parse(
        'https://www.plinul.ro/pret/benzina-standard/zalau-salaj');
    try {
      final response = await http.get(url);
      var document = parser.parse(response.body);
      html.Element? table = document.querySelector("table.table.table-striped");
      List<html.Element> rows = table!.querySelectorAll("tr");

      for (html.Element row in rows) {
        List<String> fuelInfoList = [];
        List<html.Element> cells = row.querySelectorAll("td");
        for (html.Element cell in cells) {
          String? data = cell.text;
          switch (cellCounter) {
            case 0:
              supplierName.add(data);
              if (supplierName.isNotEmpty) supplierCounter++;
              _globalSupplierName.add(data);
              break;
            case 2:
              fuelName.add(data);
              if (fuelName.isNotEmpty) fuelNameCounter++;
              _globalFuelName.add(data);
              break;
            case 3:
              fuelPrice.add(data);
              if (fuelPrice.isNotEmpty) fuelPriceCounter++;
              _globalFuelPrice.add(data);
              break;
          }
          cellCounter++;
          if (cellCounter == 5) {
            cellCounter = 0;
          }
        }
        if (supplierName.isNotEmpty) {
          String singleSupplierName = supplierName[supplierCounter].trim();
          if (!_benzinaFuelListChild.containsKey(singleSupplierName)) {
            String fuelInfo =
                "${fuelName[fuelNameCounter]} ${fuelPrice[fuelPriceCounter]}";
            if (!fuelInfoList.contains(fuelInfo)) {
              fuelInfoList.add(fuelInfo);
              _benzinaFuelListChild[singleSupplierName] = fuelInfoList;
            }
          }
        }
      }
    } catch (e) {
      print(e);
    }
    // _benzinaFuelListChild.forEach((key, value) {
    //   print('key: $key');
    //   print('value: $value');
    // });
    notifyListeners();
  }

  Future<void> getSecondSiteInfo() async {
    List<String> supplierName = [];
    List<String> fuelName = [];
    List<String> fuelPrice = [];
    List<String> benzinaPret = [];
    int cellCounter = 0;
    int supplierCounter = -1;
    int fuelNameCounter = -1;
    int fuelPriceCounter = -1;

    Uri url =
        Uri.parse('https://www.plinul.ro/pret/motorina-standard/zalau-salaj');
    try {
      final response = await http.get(url);
      var document = parser.parse(response.body);
      html.Element? table = document.querySelector("table.table.table-striped");
      List<html.Element> rows = table!.querySelectorAll("tr");

      for (html.Element row in rows) {
        List<String> fuelInfoList = [];
        List<html.Element> cells = row.querySelectorAll("td");
        for (html.Element cell in cells) {
          String? data = cell.text;
          switch (cellCounter) {
            case 0:
              supplierName.add(data);
              if (supplierName.isNotEmpty) supplierCounter++;
              _globalSupplierName.add(data);
              break;
            case 2:
              fuelName.add(data);
              if (fuelName.isNotEmpty) fuelNameCounter++;
              _globalFuelName.add(data);
              break;
            case 3:
              fuelPrice.add(data);
              if (fuelPrice.isNotEmpty) fuelPriceCounter++;
              _globalFuelPrice.add(data);
              break;
          }
          cellCounter++;
          if (cellCounter == 5) {
            cellCounter = 0;
          }
        }
        if (supplierName.isNotEmpty) {
          //ia benzina de dinainte (din getFirstSiteFuelInfo)
          benzinaPret.clear();
          String singleSupplierName = supplierName[supplierCounter].trim();
          benzinaPret = _benzinaFuelListChild[singleSupplierName] ?? [];
          if (benzinaPret.length == 1) {
            //adauga motorina
            String motorina =
                "${fuelName[fuelNameCounter]} ${fuelPrice[fuelPriceCounter]}";
            fuelInfoList.clear();
            fuelInfoList.add(benzinaPret[0]);
            fuelInfoList.add(motorina);
            // print("BENZINA + MOTORINA: ${fuelInfoList.toString()}");
            //adauga la supplierName benzina + motorina
            _fuelListChild[singleSupplierName] = fuelInfoList;
          }
        }
      }
    } catch (e) {
      print(e);
    }
    notifyListeners();
  }
}
