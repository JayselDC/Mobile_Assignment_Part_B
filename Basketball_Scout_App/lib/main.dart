import 'package:flutter/material.dart';

import './dummy_data.dart';
import './models/player.dart';
import './screens/tabs_screen.dart';
import './screens/players_filter_screen.dart';
import './screens/selected_position_screen.dart';
import './screens/player_details_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Player> _matchingPlayers = DUMMY_PLAYERS;
  List<Player> _favouritePlayers = [];

  Map<String, bool> _filters = {
    'showS': true,
    'showA': true,
    'showB': true,
    'showC': true,
    'showD': true,
    'showE': true,
  };

  // Sets the intial filters that are applied on the app
  void _setFilters(Map<String, bool> filterData) {
    setState(
      () {
        _filters = filterData;

        _matchingPlayers = DUMMY_PLAYERS.where((player) {
          if (_filters['showS'] && player.grade == 'S') {
            return true;
          }
          if (_filters['showA'] && player.grade == 'A') {
            return true;
          }
          if (_filters['showB'] && player.grade == 'B') {
            return true;
          }
          if (_filters['showC'] && player.grade == 'C') {
            return true;
          }
          if (_filters['showD'] && player.grade == 'D') {
            return true;
          }
          if (_filters['showE'] && player.grade == 'E') {
            return true;
          }
          return false;
        }).toList();
      },
    );
  }

  // Handles the adding and removing of a player from the favourites list
  void _toggleFavourite(String playerId) {
    final existingIndex =
        _favouritePlayers.indexWhere((player) => player.id == playerId);

    if (existingIndex >= 0) {
      setState(() {
        _favouritePlayers.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favouritePlayers
            .add(DUMMY_PLAYERS.firstWhere((player) => player.id == playerId));
      });
    }
  }

  // Gets a boolean to check if a player is a favourite
  bool _isPlayerFavourite(String playerId) {
    return _favouritePlayers.any((player) => player.id == playerId);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Basketball Scouting App',
      // Sets a reusable template of styles for the app
      theme: ThemeData(
        primaryColor: Colors.indigo[900],
        accentColor: Colors.redAccent[400],
        fontFamily: 'Delirium',
        textTheme: TextTheme(
          headline1: const TextStyle(
            color: Colors.white,
            fontFamily: 'Jackport-College',
            fontSize: 40,
          ),
          headline2: const TextStyle(
            color: Colors.white,
            fontSize: 40,
          ),
          headline3: const TextStyle(
            color: Colors.white,
            fontSize: 26,
          ),
          headline4: TextStyle(
            color: Colors.indigo[900],
            fontSize: 56,
          ),
          headline5: const TextStyle(fontSize: 30),
        ),
      ),
      // Tells the app what each page's route is
      routes: {
        '/': (ctx) => TabsScreen(
              _filters,
              _setFilters,
              _favouritePlayers,
            ),
        SelectedPositionScreen.route: (ctx) => SelectedPositionScreen(
              _matchingPlayers,
            ),
        PlayersFilterScreen.route: (ctx) => PlayersFilterScreen(
              _filters,
              _setFilters,
            ),
        PlayerDetailsScreen.route: (ctx) => PlayerDetailsScreen(
              _toggleFavourite,
              _isPlayerFavourite,
            ),
      },
    );
  }
}
