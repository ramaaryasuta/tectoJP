import 'package:flutter/material.dart';

import '../helper/navigator_helper.dart';

enum SnackbarType { success, error }

void showSnackbar({
  required String message,
  int milliseconds = 1000,
  SnackbarType type = SnackbarType.success,
}) {
  final snackBar = SnackBar(
      duration: Duration(milliseconds: milliseconds),
      content: Text(message),
      backgroundColor:
          type == SnackbarType.success ? Colors.green : Colors.red);
  ScaffoldMessenger.of(globalCurrentContext).showSnackBar(snackBar);
}
