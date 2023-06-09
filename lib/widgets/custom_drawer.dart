import 'package:calculator_consum/providers/fuel_provider.dart';
import 'package:calculator_consum/widgets/fuel_item_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  Future<void> _refreshPrices(FuelProvider fuelProvider) async {
    await fuelProvider.getFirstSiteInfo();
    await fuelProvider.getSecondSiteInfo();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return FutureBuilder(
      future: _refreshPrices(Provider.of<FuelProvider>(context, listen: false)),
      builder: (context, snapshot) =>
          snapshot.connectionState == ConnectionState.waiting
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : RefreshIndicator(
                  onRefresh: () => _refreshPrices(
                      Provider.of<FuelProvider>(context, listen: false)),
                  child: Drawer(
                    backgroundColor: Colors.black,
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(
                            left: 60,
                            right: 60,
                            top: 50,
                            bottom: 10,
                          ),
                          child: Image.asset('assets/images/fuel_gauge.png'),
                        ),
                        const Text(
                          'Calculator Consum',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SingleChildScrollView(
                          child: Consumer<FuelProvider>(
                              builder: (context, fuelData, _) {
                            final fuelSupplierList =
                                fuelData.fuelData.keys.toList();
                            return SizedBox(
                              height: height * 0.7,
                              child: ListView(
                                children: fuelSupplierList.map((supplier) {
                                  return FuelItemList(supplier: supplier);
                                }).toList(),
                              ),
                            );
                          }),
                        )
                      ],
                    ),
                  ),
                ),
    );
  }
}
