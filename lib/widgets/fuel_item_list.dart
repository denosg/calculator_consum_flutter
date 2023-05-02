import 'dart:math';

import 'package:calculator_consum/providers/fuel_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class FuelItemList extends StatefulWidget {
  @override
  State<FuelItemList> createState() => _FuelItemListState();
}

class _FuelItemListState extends State<FuelItemList> {
  @override
  Widget build(BuildContext context) {
    var _expanded = false;

    return Consumer<FuelProvider>(builder: (context, fuelData, _) {
      final fuelSupplierList = fuelData.fuelData.keys.toList();
      return Container(
        color: Colors.amber,
        height: 500,
        child: ListView(
          children: fuelSupplierList.map((supplier) {
            return AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              height: _expanded
                  ? min(fuelData.fuelData[supplier]!.length * 20.0 + 122, 212)
                  : 66,
              child: Card(
                child: Column(
                  children: [
                    ListTile(
                      title: Text(supplier),
                      trailing: IconButton(
                        onPressed: () {
                          setState(() {
                            _expanded = !_expanded;
                          });
                        },
                        icon: Icon(
                            _expanded ? Icons.expand_less : Icons.expand_more),
                      ),
                    ),
                    //Shows the list of products bought
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 4),
                      height: _expanded
                          ? min(fuelData.fuelData[supplier]!.length * 20.0 + 30,
                              130)
                          : 0,
                      //Creates the list of products bought
                      child: ListView(
                          children: fuelData.fuelData[supplier]!
                              .map((fuel) => Row(
                                    children: [
                                      Text(
                                        fuel,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ],
                                  ))
                              .toList()),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      );
    });
  }
}
