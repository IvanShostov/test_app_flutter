import 'dart:math';
import 'package:flutter/material.dart';

import '/colors.dart';

class ValueProvider with ChangeNotifier {
  bool isWeek = true;
  late Map<String, dynamic> values = {
    'Body': {'value': 59, 'color': ColorsApp.bodyColor},
    'Mind': {'value': 25, 'color': ColorsApp.mindyColor},
    'Spirit': {'value': 16, 'color': ColorsApp.spiritColor},
  };

  Map<String, dynamic> generateRandomValues() {
    Random random = Random();

    int total = 100;

    int body = random.nextInt(total + 1);
    int mind = random.nextInt(total - body + 1);
    int spirit = total - body - mind;

    Map<String, dynamic> result = {
      'Body': {'value': body, 'color': ColorsApp.bodyColor},
      'Mind': {'value': mind, 'color': ColorsApp.mindyColor},
      'Spirit': {'value': spirit, 'color': ColorsApp.spiritColor},
    };

    return result;
  }

  void changeValues() {
    values = generateRandomValues();
    notifyListeners();
  }

  void changeBoolWeek() {
    isWeek = !isWeek;
    notifyListeners();
  }
}
