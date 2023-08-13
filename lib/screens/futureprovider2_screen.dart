import 'package:f_test03/providers/futureprovider_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FutureProvider2Screen extends StatelessWidget {
  const FutureProvider2Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Future Provider2'),
      ),
      body: Center(
        child: Consumer<FutureProviderModel>(builder: (_, fProv, __) {
          return Text(
            'counter : ${fProv.counter}',
            style: const TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final fModel =
              Provider.of<FutureProviderModel>(context, listen: false);

          fModel.incrementCounter();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
