import 'package:f_test03/providers/provider_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/changenotifierprovider_model.dart';

class ChangeNotifierProviderScreen extends StatelessWidget {
  const ChangeNotifierProviderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Change Notifier Provider'),
      ),
      body: Center(
        child: Consumer2<ProviderModel, ChangeNotifierModel>(
          builder: (context, provModel, cnModel, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'counter: ${cnModel.counter}',
                  style: const TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'baseURl: ${cnModel.provModel.baseUrl},',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // final aa=context.watch<ChangeNotifierModel>();
          final provModel =
              Provider.of<ChangeNotifierModel>(context, listen: false);

          provModel.incrementCounter();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
