import 'package:flutter/material.dart';

class BeerButtonProvider extends ChangeNotifier {
  bool isPressed;
  bool isSelected;

  BeerButtonProvider({
    this.isPressed = false,
    this.isSelected = false,
  });

  void changePressed(bool pressed) {
    isPressed = pressed;
    notifyListeners();
  }

  void selected(bool select) {
    isSelected = select;
    notifyListeners();
  }
}
