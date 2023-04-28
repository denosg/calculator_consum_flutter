import 'package:flutter/material.dart';

import './widgets/data_form.dart';

class AppHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            child: DataForm(),
          ),
        ]),
      ),
    );
  }
}
