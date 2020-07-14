import 'package:flutter/material.dart';

import './positions_screen.dart';
import './favourites_screen.dart';
import './players_filter_screen.dart';
import '../models/player.dart';

class TabsScreen extends StatefulWidget {
  final Map<String, bool> filterData;
  final Function saveFilters;
  final List<Player> favouritePlayers;

  TabsScreen(this.filterData, this.saveFilters, this.favouritePlayers);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _pages;
  var _selectedPageIndex = 0;

  @override
  void initState() {
    _pages = [
      {
        'page': PositionsScreen(),
        'title': 'Positions',
      },
      {
        'page': FavouritesScreen(widget.favouritePlayers),
        'title': 'Favourites',
      },
      {
        'page': PlayersFilterScreen(widget.filterData, widget.saveFilters),
        'title': 'Filters',
      },
    ];
    super.initState();
  }

  void _selectPage(int i) {
    setState(() {
      _selectedPageIndex = i;
    });
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
              _pages[_selectedPageIndex]['title'],
              style: Theme.of(context).textTheme.headline2,
              textAlign: TextAlign.center,
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.white,
        currentIndex: _selectedPageIndex,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: const Icon(
              Icons.person_outline,
            ),
            title: Text(
              'Positions',
              style: Theme.of(context).textTheme.headline3,
            ),
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: const Icon(
              Icons.favorite_border,
            ),
            title: Text(
              'Favourites',
              style: Theme.of(context).textTheme.headline3,
            ),
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: const Icon(
              Icons.filter_list,
            ),
            title: Text(
              'Filters',
              style: Theme.of(context).textTheme.headline3,
            ),
          ),
        ],
        onTap: _selectPage,
      ),
    );
  }
}
