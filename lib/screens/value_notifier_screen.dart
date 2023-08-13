import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ValueNotifierScreen extends StatelessWidget {
  const ValueNotifierScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Value Notifier Provider'),
      ),
      body: Consumer<ValueNotifier<int>>(
        builder: (_, vNotifier, __) {
          return Center(
            child: Text(
              'counter: ${vNotifier.value}',
              style: const TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final counter =
              Provider.of<ValueNotifier<int>>(context, listen: false);
          counter.value++;
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
