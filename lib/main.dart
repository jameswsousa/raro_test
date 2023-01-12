import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:raro_test/modules/parking/presenter/pages/home_page.dart';
import 'package:raro_test/modules/root/app.dart';
import 'package:raro_test/modules/root/app_module.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ModularApp(module: AppModule(), child: const App()));
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Parking',
        theme: ThemeData(primarySwatch: Colors.teal),
        home: HomePage());
  }
}
