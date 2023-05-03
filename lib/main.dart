import 'package:calculator_consum/providers/data_provider.dart';
import 'package:calculator_consum/providers/fuel_price_transfer.dart';
import 'package:calculator_consum/providers/fuel_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import './app_home.dart';
import 'package:provider/provider.dart';

void main() {
  //Makes it so SystemChrome.setPreferredOrientations works
  WidgetsFlutterBinding.ensureInitialized();
  //Sets preffered orientations
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  //Runs the app on boot
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
        ChangeNotifierProvider(
          create: (context) => FuelPriceTransfer(),
        )
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
