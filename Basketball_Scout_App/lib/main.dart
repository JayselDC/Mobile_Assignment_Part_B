import 'package:flutter/material.dart';

import './screens/tabs_screen.dart';
import './screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.indigo[900],
        accentColor: Colors.redAccent[400]
      ),
      routes: {
        '/': (ctx) => TabsScreen(),
      },
    );
  }
}