Future<FutureProviderModel> futureProviderFunc() async {
  await Future.delayed(const Duration(seconds: 2));
  return FutureProviderModel(counter: 1);
}

class FutureProviderModel {
  int counter;
  FutureProviderModel({required this.counter});
  void incrementCounter() {
    counter++;
    print("Future provider : $counter");
  }
}
