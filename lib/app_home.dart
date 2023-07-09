import 'dart:async';

import 'package:calculator_consum/providers/data_provider.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './widgets/data_form.dart';
import './widgets/custom_drawer.dart';
import './widgets/show_calculated.dart';

class AppHome extends StatefulWidget {
  const AppHome({super.key});

  @override
  State<AppHome> createState() => _AppHomeState();
}

class _AppHomeState extends State<AppHome> {
  String string = 'Offline';
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  @override
  void initState() {
    super.initState();
    _connectivitySubscription =
        Connectivity().onConnectivityChanged.listen((result) {
      setState(() {
        switch (result) {
          case ConnectivityResult.wifi:
            string = 'Online';
            break;
          case ConnectivityResult.mobile:
            string = 'Online';
            break;
          case ConnectivityResult.none:
          default:
            string = 'Offline';
        }
      });
      _showConnectivitySnackbar();
    });
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }

  void _showConnectivitySnackbar() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            string,
            style: const TextStyle(fontSize: 15),
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: const CustomDrawer(),
      backgroundColor: Colors.black,
      body: Consumer<DataProvider>(
        builder: (context, dataValues, _) => SingleChildScrollView(
          child: Column(children: [
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
                fontSize: 25,
              ),
            ),
            const SizedBox(height: 10),
            Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 310,
                  // color: Colors.red,
                  padding: const EdgeInsets.all(20),
                  child: DataForm(_scaffoldKey),
                ),
                if (dataValues.goodStatus)
                  ShowCalculated(
                    distanta: dataValues.distanta,
                    consum: dataValues.consum,
                    price: dataValues.pret,
                  ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
