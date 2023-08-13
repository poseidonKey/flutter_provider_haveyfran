Stream<StreamProviderModel> streamProviderFunc() {
  return Stream<StreamProviderModel>.periodic(const Duration(seconds: 1),
      (counter) => StreamProviderModel(counter: counter + 1)).take(100);
}

class StreamProviderModel {
  int counter;
  StreamProviderModel({required this.counter});
  void incrementCounter() {
    counter++;
    print("stream provider : $counter");
  }
}
