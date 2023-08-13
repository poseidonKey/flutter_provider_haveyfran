import 'package:f_test03/providers/changenotifierprovider_all_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/futureprovider_model.dart';
import '../providers/provider_model.dart';
import '../providers/streamprovider_model.dart';

class ChangeNotifierModelAllScreen extends StatelessWidget {
  const ChangeNotifierModelAllScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Change Notifier Provider All'),
      ),
      body: Center(
        child: Consumer4<ProviderModel, FutureProviderModel,
            StreamProviderModel, ChangeNotifierModelAll>(
          builder: (context, provModel, fModel, sModel, cnModel, child) {
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
                  'fModel: ${fModel.counter}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'sModel: ${sModel.counter}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'myStream Count: ${cnModel.myStreamValue}',
                  style: const TextStyle(
                    fontSize: 18,
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
          final cnModel =
              Provider.of<ChangeNotifierModelAll>(context, listen: false);

          cnModel.incrementCounter();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
