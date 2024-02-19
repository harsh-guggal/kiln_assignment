import 'package:flutter/material.dart';

class DashboardProvider extends ChangeNotifier {
  int dashboardIndex = 0;

  setIndex(int value) {
    dashboardIndex = value;
    notifyListeners();
  }
}
