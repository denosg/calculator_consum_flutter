import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
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
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}
