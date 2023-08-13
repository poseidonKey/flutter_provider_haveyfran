import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(const HomePage());

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Provider(
          create: (context) {
            int sum = 0;
            for (int i = 1; i <= 10; i++) {
              sum += i;
            }
            return sum;
          },
          child: const Center(child: SubWidget()),
        ),
      ),
    );
  }
}

class SubWidget extends StatelessWidget {
  const SubWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final int t = Provider.of<int>(context);
    return Container(
      child: Text("resuult : $t"),
    );
  }
}
