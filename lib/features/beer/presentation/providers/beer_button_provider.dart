import 'package:flutter/material.dart';

class BeerButtonProvider extends ChangeNotifier {
  bool isPressed;

  BeerButtonProvider({
    this.isPressed = false,
  });

  void changePressed(bool pressed) {
    isPressed = pressed;
    notifyListeners();
  }
}
