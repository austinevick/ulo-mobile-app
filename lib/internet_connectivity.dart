import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';

import 'widgets/animated_dialog.dart';
import 'widgets/custom_alert_dialog.dart';

class NetworkConnectivityChecker {
  static checkConnection(BuildContext context, Function function) async {
    var result = await Connectivity().checkConnectivity();
    if (result == ConnectivityResult.none) {
      animatedDialog(
          context: context,
          child: CustomAlertDialog(
            title: 'Internet Error',
            content: Text('Please check your internet connection'),
          ));
    } else if (result == ConnectivityResult.mobile) {
      function();
    } else if (result == ConnectivityResult.wifi) {
      function();
    }
  }
}
