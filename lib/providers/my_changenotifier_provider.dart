import 'package:flutter/material.dart';

class MyChangeNotifierProviderModel with ChangeNotifier {
  final List<String> _myItems = [];
  List<String> get myItems => _myItems;
  void addItem(String val) {
    _myItems.add(val);
    // print(myItems);
    notifyListeners();
  }

  void delItem(int val) {
    _myItems.removeAt(val);
    notifyListeners();
  }
}
