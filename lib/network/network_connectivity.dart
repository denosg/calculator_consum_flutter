import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/fuel_provider.dart';

class NetworkConnectivity {
  NetworkConnectivity._();
  static final _instance = NetworkConnectivity._();
  static NetworkConnectivity get instance => _instance;
  final _networkConnectivity = Connectivity();
  final _controller = StreamController.broadcast();
  Stream get myStream => _controller.stream;
  // 1.
  void initialise(BuildContext context) async {
    ConnectivityResult result = await _networkConnectivity.checkConnectivity();
    _checkStatus(result, context);
    _networkConnectivity.onConnectivityChanged.listen((result) {
      print(result);
      _checkStatus(result, context);
    });
  }

// 2.
  void _checkStatus(ConnectivityResult result, BuildContext context) async {
    bool isOnline = false;
    try {
      Provider.of<FuelProvider>(context, listen: false).getFirstSiteInfo();
      Provider.of<FuelProvider>(context, listen: false).getSecondSiteInfo();
      final result = await InternetAddress.lookup('example.com');
      isOnline = result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      isOnline = false;
    }
    _controller.sink.add({result: isOnline});
  }

  void disposeStream() => _controller.close();
}
