import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/home",
      debugShowCheckedModeBanner: false,
    ).modular();
  }
}
