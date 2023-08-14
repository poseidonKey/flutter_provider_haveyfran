import 'package:f_test03/providers/my_changenotifier_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyChangeNotifierProviderEditScreen extends StatelessWidget {
  final int choiceItem;
  const MyChangeNotifierProviderEditScreen(
      {super.key, required this.choiceItem});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Provider'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.breakfast_dining),
          )
        ],
      ),
      body: Center(
        child: Consumer<MyChangeNotifierProviderModel>(
          builder: (context, myCnprovider, child) {
            return Text('data : ${myCnprovider.myItems[choiceItem].mData}');
          },
        ),
      ),
    );
  }
}
