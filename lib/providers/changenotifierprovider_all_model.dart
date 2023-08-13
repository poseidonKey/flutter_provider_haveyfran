import 'package:f_test03/providers/provider_model.dart';
import 'package:f_test03/providers/streamprovider_model.dart';
import 'package:flutter/material.dart';
import 'futureprovider_model.dart';

class ChangeNotifierModelAll with ChangeNotifier {
  int counter = 0;
  int get myStreamValue => sModel.counter * 10;
  ProviderModel _providerModel = ProviderModel();
  ProviderModel get provModel => _providerModel;
  set provModel(ProviderModel provModelVal) {
    if (_providerModel != provModelVal) {
      _providerModel = provModelVal;
      notifyListeners();
    }
  }

  StreamProviderModel _sModel = StreamProviderModel(counter: 0);
  StreamProviderModel get sModel => _sModel;
  set sModel(StreamProviderModel sModelVale) {
    if (_sModel != sModelVale) {
      _sModel = sModelVale;
      notifyListeners();
    }
  }

  FutureProviderModel _fModel = FutureProviderModel(counter: 0);
  FutureProviderModel get fModel => _fModel;
  set fModel(FutureProviderModel fModelVal) {
    if (_fModel != fModelVal) {
      _fModel = fModelVal;
      notifyListeners();
    }
  }

  void incrementCounter() {
    counter++;
    notifyListeners();
  }
}
