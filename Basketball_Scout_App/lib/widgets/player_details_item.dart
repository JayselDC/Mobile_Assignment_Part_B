import 'package:flutter/material.dart';

import '../screens/player_details_screen.dart';

class PlayerDetailsItem extends StatelessWidget {
  final String name;
  final String position;
  final int age;
  final String grade;
  final String id;
  final String imgUrl;

  PlayerDetailsItem({
    @required this.name,
    @required this.position,
    @required this.age,
    @required this.grade,
    @required this.id,
    this.imgUrl
  });

  void selectPlayer(BuildContext context) {
    Navigator.of(context).pushNamed(PlayerDetailsScreen.route, arguments: id);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: Text(
            name,
            style: TextStyle(fontSize: 40),
          ),
          subtitle: Text(
            '${age.toString()} Years Old',
            style: TextStyle(fontSize: 24),
          ),
          leading: Hero(
            tag: name,
            child: CircleAvatar(
              radius: 30,
              backgroundImage: imgUrl != '' ? ExactAssetImage(imgUrl) : null,
              backgroundColor: Colors.blue[100],
            ),
          ),
          trailing: Text(
            grade,
            style: TextStyle(
              fontFamily: 'Delirium-Neon',
              fontSize: 70,
              color: Theme.of(context).accentColor
            ),
          ),
          onTap: () => selectPlayer(context),
        ),
        const Divider(),
      ],
    );
  }
}
