import 'package:flutter/material.dart';

class PlayersFilterScreen extends StatefulWidget {
  static const route = '/players-filter';

  final Map<String, bool> currentFilters;
  final Function saveFilters;

  PlayersFilterScreen(this.currentFilters, this.saveFilters);

  @override
  _PlayersFilterScreenState createState() => _PlayersFilterScreenState();
}

class _PlayersFilterScreenState extends State<PlayersFilterScreen> {
  var _showSClass = true;
  var _showAClass = true;
  var _showBClass = true;
  var _showCClass = true;
  var _showDClass = true;
  var _showEClass = true;

  void _handleSaveFilter() {
    final _selectedFilters = {
      'showS': _showSClass,
      'showA': _showAClass,
      'showB': _showBClass,
      'showC': _showCClass,
      'showD': _showDClass,
      'showE': _showEClass,
    };

    widget.saveFilters(_selectedFilters);

    Navigator.of(context).popAndPushNamed('/');
  }

  @override
  void initState() {
    _showSClass = widget.currentFilters['showS'];
    _showAClass = widget.currentFilters['showA'];
    _showBClass = widget.currentFilters['showB'];
    _showCClass = widget.currentFilters['showC'];
    _showDClass = widget.currentFilters['showD'];
    _showEClass = widget.currentFilters['showE'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget _buildSwitchListTile(String title, bool val, Function update) {
      return Column(
        children: <Widget>[
          SwitchListTile(
            title: Text(
              title,
              style: Theme.of(context).textTheme.headline5,
            ),
            value: val,
            onChanged: update,
          ),
          Divider()
        ],
      );
    }

    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView(
              children: <Widget>[
                _buildSwitchListTile(
                  'Display S-Class',
                  _showSClass,
                  (newVal) {
                    setState(() {
                      _showSClass = newVal;
                    });
                  },
                ),
                _buildSwitchListTile(
                  'Display A-Class',
                  _showAClass,
                  (newVal) {
                    setState(() {
                      _showAClass = newVal;
                    });
                  },
                ),
                _buildSwitchListTile(
                  'Display B-Class',
                  _showBClass,
                  (newVal) {
                    setState(() {
                      _showBClass = newVal;
                    });
                  },
                ),
                _buildSwitchListTile(
                  'Display C-Class',
                  _showCClass,
                  (newVal) {
                    setState(() {
                      _showCClass = newVal;
                    });
                  },
                ),
                _buildSwitchListTile(
                  'Display D-Class',
                  _showDClass,
                  (newVal) {
                    setState(() {
                      _showDClass = newVal;
                    });
                  },
                ),
                _buildSwitchListTile(
                  'Display E-Class',
                  _showEClass,
                  (newVal) {
                    setState(() {
                      _showEClass = newVal;
                    });
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                FlatButton(
                  onPressed: _handleSaveFilter,
                  child: Text(
                    'Save Filters',
                    style: TextStyle(
                      color: Theme.of(context).accentColor,
                      fontSize: 32
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
