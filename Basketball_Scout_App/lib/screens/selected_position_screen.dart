import 'package:flutter/material.dart';

import './players_filter_screen.dart';


class SelectedPositionScreen extends StatefulWidget {
  static const route = '/selected-position';

  @override
  _SelectedPositionScreenState createState() => _SelectedPositionScreenState();
}

class _SelectedPositionScreenState extends State<SelectedPositionScreen> {
  String _positionName;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;

    _positionName = routeArgs['positionName'];

    super.didChangeDependencies();
  }

  void openFilters() {
    Navigator.of(context).pushNamed(PlayersFilterScreen.route);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${_positionName}s'),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.filter_list,
              color: Colors.white,
            ),
            onPressed: openFilters,
          )
        ],
      ),
    );
  }
}
