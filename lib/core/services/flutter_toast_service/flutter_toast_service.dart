import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

enum ToastType { error, success }

final class FlutterToastService {
  void showToast(String message, {ToastType type = ToastType.success}) async {
    Color background = Colors.black;

    if (type == ToastType.error) {
      background = Colors.red;
    }

    await Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: background,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}
