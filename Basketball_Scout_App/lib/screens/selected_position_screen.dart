import 'package:flutter/material.dart';

import '../models/player.dart';
import '../widgets/player_details_item.dart';
import './players_filter_screen.dart';

// Following screen from the positions which then displays all the players who match the respective position
class SelectedPositionScreen extends StatefulWidget {
  static const route = '/selected-position';

  final List<Player> matchingPlayers;

  SelectedPositionScreen(
    this.matchingPlayers,
  );

  @override
  _SelectedPositionScreenState createState() => _SelectedPositionScreenState();
}

class _SelectedPositionScreenState extends State<SelectedPositionScreen> {
  String _positionName;
  List<Player> _displayedPlayers;

  @override
  void initState() {
    super.initState();
  }

  // Checks if filters have been applied
  @override
  void didChangeDependencies() {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;

    _positionName = routeArgs['positionName'];

    _displayedPlayers = widget.matchingPlayers.where(
      (player) {
        return player.position == _positionName;
      },
    ).toList();

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: <Widget>[
            const SizedBox(
              height: 8,
            ),
            Text(
              '${_positionName}s',
              style: Theme.of(context).textTheme.headline2,
            ),
          ],
        ),
      ),
      // Using a builder function which will handle when an unknown amount of players will be generated
      body: ListView.builder(
        itemBuilder: (ctx, i) {
          return PlayerDetailsItem(
            name: _displayedPlayers[i].name,
            position: _displayedPlayers[i].position,
            age: _displayedPlayers[i].age,
            grade: _displayedPlayers[i].grade,
            id: _displayedPlayers[i].id,
            imgUrl: _displayedPlayers[i].image,
          );
        },
        itemCount: _displayedPlayers.length,
      ),
    );
  }
}
