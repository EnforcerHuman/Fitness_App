import 'package:flutter/material.dart';

void showSnackBar(context, String content, color) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        content,
        style: TextStyle(color: color),
      ),
      duration: const Duration(seconds: 3),
      action: SnackBarAction(
        label: 'Close',
        onPressed: () {
          // Action to be performed when the 'Close' button is pressed
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
        },
      ),
    ),
  );
}
