import 'package:f_test03/providers/provider_model.dart';
import 'package:flutter/material.dart';

class ChangeNotifierModel with ChangeNotifier {
  int counter = 0;
  ProviderModel _providerModel = ProviderModel();
  ProviderModel get provModel => _providerModel;
  set provModel(ProviderModel provModelVal) {
    if (_providerModel != provModelVal) {
      _providerModel = provModelVal;
      notifyListeners();
    }
  }

  void incrementCounter() {
    counter++;
    notifyListeners();
  }
}
