import 'package:flutter/material.dart';

import './app_home.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          textTheme:
              const TextTheme(bodyMedium: TextStyle(color: Colors.white)),
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.purple,
            secondary: Colors.white,
          )),
      home: AppHome(),
    );
  }
}
