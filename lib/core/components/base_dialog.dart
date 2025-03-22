import 'package:flutter/material.dart';

import '../helper/navigator_helper.dart';

void baseDialog({required Widget child}) {
  showDialog(
    context: globalCurrentContext,
    builder: (context) => Dialog(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: child,
      ),
    ),
  );
}
