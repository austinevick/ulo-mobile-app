import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:ulo_mobile_spa/widgets/show_alert_dialog.dart';

Future<bool> showExceptionAlertDialog(BuildContext context,
        {String title, Exception exception}) =>
    showAlertDialog(context,
        title: title, defaultActionText: 'OK', content: _message(exception));

String _message(Exception exception) {
  if (exception is FirebaseAuthException) {
    return exception.message;
  }
  return exception.toString();
}
