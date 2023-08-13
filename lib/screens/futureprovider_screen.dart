import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FutureProviderScreen extends StatelessWidget {
  const FutureProviderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Future Provider'),
      ),
      body: Center(
        child: Consumer<Map<String, int>>(builder: (_, fProv, __) {
          return Text(
            'counter : ${fProv['value']}',
            style: const TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
          );
        }),
      ),
    );
  }
}
