import 'package:flutter/material.dart';

class PlayersFilterScreen extends StatelessWidget {
  static const route = 'players-filter';

  void saveFilters() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: saveFilters,
          ),
        ],
      ),
    );
  }
}
