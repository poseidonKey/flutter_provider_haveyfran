import 'package:f_test03/providers/changenotifierprovider_all_model.dart';
import 'package:f_test03/providers/changenotifierprovider_model.dart';
import 'package:f_test03/providers/futureprovider_model.dart';
import 'package:f_test03/providers/my_changenotifier_provider.dart';
import 'package:f_test03/providers/provider_model.dart';
import 'package:f_test03/providers/streamprovider_model.dart';
import 'package:f_test03/screens/changenotifierprovider_all_screen.dart';
import 'package:f_test03/screens/changenotifierprovider_screen.dart';
import 'package:f_test03/screens/futureprovider2_screen.dart';
import 'package:f_test03/screens/futureprovider_screen.dart';
import 'package:f_test03/screens/my_changenotifierprovider_screen.dart';
import 'package:f_test03/screens/provider_screen.dart';
import 'package:f_test03/screens/streamprovider_screen.dart';
import 'package:f_test03/screens/value_notifier_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<ProviderModel>(
          create: (context) => ProviderModel(),
        ),
        ChangeNotifierProxyProvider<ProviderModel, ChangeNotifierModel>(
            create: (context) => ChangeNotifierModel(),
            update: (context, provModel, cnModel) {
              cnModel!.provModel = provModel;
              return cnModel;
            }),
        ChangeNotifierProxyProvider3<ProviderModel, FutureProviderModel,
                StreamProviderModel, ChangeNotifierModelAll>(
            create: (context) => ChangeNotifierModelAll(),
            update: (context, provModel, fModel, sModel, cnModel) {
              cnModel!.provModel = provModel;
              cnModel.fModel = fModel;
              cnModel.sModel = sModel;
              return cnModel;
            }),
        ChangeNotifierProvider<ValueNotifier<int>>(
          create: (_) => ValueNotifier(0),
        ),
        ChangeNotifierProvider<MyChangeNotifierProviderModel>(
          create: (_) => MyChangeNotifierProviderModel(),
        ),
        FutureProvider<Map<String, int>>(
            create: (_) async {
              await Future.delayed(
                const Duration(seconds: 2),
              );
              return {'value': 1};
            },
            initialData: const {'value': 0}),
        FutureProvider<FutureProviderModel>(
          create: (_) => futureProviderFunc(),
          initialData: FutureProviderModel(counter: 0),
        ),
        StreamProvider<StreamProviderModel>(
          create: (_) => streamProviderFunc(),
          initialData: StreamProviderModel(counter: 0),
        ),
      ],
      child: const MaterialApp(
        title: 'Material App',
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Material App Main'),
      ),
      body: Center(
        child: IntrinsicWidth(
          stepWidth: MediaQuery.of(context).size.width * 0.8,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const ProviderScreen();
                  }));
                },
                child: const Text(
                  'Provider',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const ChangeNotifierProviderScreen();
                  }));
                },
                child: const Text(
                  'ChangeNotifier Provider',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const ValueNotifierScreen();
                  }));
                },
                child: const Text(
                  'Value Notifier Provider',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const FutureProviderScreen();
                  }));
                },
                child: const Text(
                  'Future Provider',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const FutureProvider2Screen();
                  }));
                },
                child: const Text(
                  'Future Provider 2',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const StreamProviderScreen();
                  }));
                },
                child: const Text(
                  'Stream Provider',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const ChangeNotifierModelAllScreen();
                  }));
                },
                child: const Text(
                  'F + Stream All Provider',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const MyChangeNotifierProviderScreen();
                  }));
                },
                child: const Text(
                  'My Notifier Provider',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
