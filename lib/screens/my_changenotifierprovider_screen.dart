import 'package:f_test03/providers/my_changenotifier_provider.dart';
import 'package:f_test03/screens/my_changenotifierprovider_edit_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyChangeNotifierProviderScreen extends StatelessWidget {
  const MyChangeNotifierProviderScreen({super.key});
  static int count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Change Notifier Provider All'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const MyChangeNotifierProviderEditScreen(
                    choiceItem: 1,
                  ),
                ),
              );
            },
            icon: const Icon(Icons.breakfast_dining),
          )
        ],
      ),
      body: Center(
        child: Consumer<MyChangeNotifierProviderModel>(
          builder: (context, myCnprovider, child) {
            return ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(
                  title: GestureDetector(
                    child: Text(myCnprovider.myItems[index]),
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => MyChangeNotifierProviderEditScreen(
                          choiceItem: index,
                        ),
                      ),
                    ),
                  ),
                  leading: IconButton(
                    onPressed: () {
                      myCnprovider.delItem(index);
                    },
                    icon: const Icon(Icons.delete),
                  ),
                  trailing: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.favorite_border_outlined),
                  ),
                );
              },
              itemCount: myCnprovider.myItems.length,
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final myCnModel = Provider.of<MyChangeNotifierProviderModel>(context,
              listen: false);
          myCnModel.addItem("Item ${++count}");
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
