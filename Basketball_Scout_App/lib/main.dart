import 'package:Basketball_Scout_App/screens/players_filter_screen.dart';
import 'package:Basketball_Scout_App/screens/selected_position_screen.dart';
import 'package:flutter/material.dart';

import './screens/tabs_screen.dart';

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
        SelectedPositionScreen.route: (ctx) => SelectedPositionScreen(),
        PlayersFilterScreen.route: (ctx) => PlayersFilterScreen(),
      },
    );
  }
}