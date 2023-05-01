import 'package:calculator_consum/providers/fuel_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './widgets/data_form.dart';
import './widgets/custom_drawer.dart';

class AppHome extends StatefulWidget {
  @override
  State<AppHome> createState() => _AppHomeState();
}

class _AppHomeState extends State<AppHome> {
  var _isLoading = true;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void didChangeDependencies() {
    if (_isLoading) {
      // TODO: CHECK FOR INTERNET CONNECTION TO RUN THESE:
      Provider.of<FuelProvider>(context, listen: false).getFirstSiteInfo();
      Provider.of<FuelProvider>(context, listen: false).getSecondSiteInfo();
    }
    _isLoading = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: CustomDrawer(),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
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
          Container(
            width: double.infinity,
            height: 310,
            // color: Colors.red,
            padding: const EdgeInsets.all(20),
            child: DataForm(_scaffoldKey),
          ),
        ]),
      ),
    );
  }
}
