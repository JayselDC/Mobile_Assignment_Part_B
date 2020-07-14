import 'package:Basketball_Scout_App/screens/positions_screen.dart';
import 'package:flutter/material.dart';

import './positions_screen.dart';
import './favourites_screen.dart';

class TabsScreen extends StatefulWidget {
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
        'page': FavouritesScreen(),
        'title': 'Favourites',
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
        title: Container(
          child: Text(
            _pages[_selectedPageIndex]['title'],
          ),
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
            icon: Icon(
              Icons.person_outline,
            ),
            title: Text('Positions'),
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(
              Icons.favorite_border,
            ),
            title: Text('Favourites'),
          ),
        ],
        onTap: _selectPage,
      ),
    );
  }
}
