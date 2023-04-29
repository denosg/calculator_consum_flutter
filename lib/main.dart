import 'package:calculator_consum/providers/data_provider.dart';
import 'package:calculator_consum/providers/fuel_provider.dart';
import 'package:flutter/material.dart';

import './app_home.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => DataProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => FuelProvider(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
            textTheme:
                const TextTheme(bodyMedium: TextStyle(color: Colors.white)),
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.purple,
              secondary: Colors.white,
            )),
        home: AppHome(),
      ),
    );
  }
}
