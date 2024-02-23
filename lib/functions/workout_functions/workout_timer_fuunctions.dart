import 'package:flutter/material.dart';

void startTimer(BuildContext context, Function setStateCallback, isRunning) {
  setStateCallback(() {
    isRunning = true;
  });
}
