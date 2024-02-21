import 'package:flutter/material.dart';

void showWarningDialog(
    BuildContext context, String warning, String description, Function test) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(warning),
        content: Text(description),
        actions: [
          TextButton(
            onPressed: () {
              test();
            },
            child: const Text('OK'),
          ),
        ],
      );
    },
  );
}
