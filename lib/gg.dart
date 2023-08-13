import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class Counter with ChangeNotifier {
  int _count = 0;
  int get count => _count;
  set count(value) => _count = value;
  void increment() {
    _count++;
    notifyListeners();
  }
}

class Sum {
  int _sum = 0;
  int get sum => _sum;
  set sum(value) {
    _sum = 0;
    for (int i = 0; i <= value; i++) {
      _sum += i;
    }
  }

  Sum({required Counter counter}) {
    _sum = counter.count;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: MultiProvider(
          providers: [
            Provider<int>.value(value: 10),
            Provider<String>.value(value: 'hello'),
            ChangeNotifierProvider<Counter>.value(
              value: Counter(),
            ),
            ChangeNotifierProvider<Counter>.value(
              value: Counter(),
            ),
            ProxyProvider<Counter, Sum>(update: (context, counter, sum) {
              if (sum != null) {
                sum.sum = counter.count;
                return sum;
              } else {
                return Sum(counter: counter);
              }
            }),
            ProxyProvider2<Counter, Sum, String>(
                update: (context, count, sum, str) {
              return 'count : ${count.count}, sum : ${sum.sum}';
            }),
          ],
          child: const SubWidget(),
        ),
      ),
    );
  }
}

class SubWidget extends StatelessWidget {
  const SubWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final Counter counter = Provider.of<Counter>(context);
    final int tInt = Provider.of<int>(context);
    final String tString = Provider.of<String>(context);
    final Sum sum = Provider.of<Sum>(context);
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('provider :'),
            Text('conter : ${counter.count}'),
            Text('conter : $tInt'),
            Text('conter : $tString'),
            Text('sum : ${sum.sum}'),
            ElevatedButton(
              onPressed: () {
                counter.increment();
              },
              child: const Text('incremnt'),
            )
          ],
        ),
      ),
    );
  }
}
