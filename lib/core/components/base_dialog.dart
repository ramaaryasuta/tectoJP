import 'package:flutter/material.dart';

import '../helper/navigator_helper.dart';

void baseDialog({required Widget child, bool barrierDismissible = true}) {
  showDialog(
    barrierDismissible: barrierDismissible,
    context: globalCurrentContext,
    builder: (context) => Dialog(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: child,
      ),
    ),
  );
}
