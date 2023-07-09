import 'dart:math';

import 'package:calculator_consum/providers/fuel_price_transfer.dart';
import 'package:calculator_consum/providers/fuel_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class FuelItemList extends StatefulWidget {
  final String supplier;

  const FuelItemList({super.key, required this.supplier});

  @override
  State<FuelItemList> createState() => _FuelItemListState();
}

class _FuelItemListState extends State<FuelItemList> {
  var _expanded = false;

  double fuelValue(String stringPrice) {
    RegExp regex = RegExp(r"\d+\.\d+(?= lei)");
    String? price = regex.stringMatch(stringPrice);
    double fuelValue = double.parse(price!);
    return fuelValue;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<FuelProvider>(builder: (context, fuelData, _) {
      return AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height: _expanded
            ? min(fuelData.fuelData[widget.supplier]!.length * 20.0 + 120, 212)
            : 64,
        child: Card(
          child: Column(
            children: [
              ListTile(
                title: Text(widget.supplier),
                trailing: IconButton(
                  onPressed: () {
                    setState(() {
                      _expanded = !_expanded;
                    });
                  },
                  iconSize: 20,
                  icon: Icon(_expanded ? Icons.expand_less : Icons.expand_more),
                ),
              ),
              //Shows the list of products bought
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                height: _expanded
                    ? min(
                        fuelData.fuelData[widget.supplier]!.length * 20.0 + 56,
                        130)
                    : 0,
                //Creates the list of products bought
                child: ListView(
                    children: fuelData.fuelData[widget.supplier]!
                        .map(
                          (fuel) => Consumer<FuelPriceTransfer>(
                            builder: (context, transfer, _) => TextButton(
                              onPressed: () {
                                Scaffold.of(context).closeEndDrawer();
                                double fuelPrice = fuelValue(fuel);
                                transfer.setFuelPrice(fuelPrice);
                              },
                              child: Text(
                                fuel,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                        )
                        .toList()),
              ),
            ],
          ),
        ),
      );
    });
  }
}
