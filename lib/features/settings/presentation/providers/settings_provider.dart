import 'package:flutter/material.dart';

class SettingsProvider extends ChangeNotifier {
  bool isSelected;

  SettingsProvider({
    this.isSelected = false,
  });

  void changeSelected(bool select) {
    isSelected = select;
    notifyListeners();
  }
}
