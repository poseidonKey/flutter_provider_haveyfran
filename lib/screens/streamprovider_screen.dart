import 'package:f_test03/providers/streamprovider_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StreamProviderScreen extends StatelessWidget {
  const StreamProviderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stream Provider'),
      ),
      body: Center(
        child: Consumer<StreamProviderModel>(builder: (_, sProv, __) {
          return Text(
            'counter : ${sProv.counter}',
            style: const TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final sModel =
              Provider.of<StreamProviderModel>(context, listen: false);
          sModel.incrementCounter();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
