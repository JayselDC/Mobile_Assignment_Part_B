import 'package:flutter/material.dart';

// UI widget for the player details screen
class PlayerInfoCard extends StatelessWidget {
  final int age;
  final int height;
  final String position;
  final String grade;

  PlayerInfoCard({
    @required this.age,
    @required this.height,
    @required this.position,
    @required this.grade,
  });

  // Shortens the position name to it's acronym form
  String shortenedPositionName(String posName) {
    if (posName == 'Point Guard') {
      return 'PG';
    }
    if (posName == 'Shooting Guard') {
      return 'SG';
    }
    if (posName == 'Small Forward') {
      return 'SF';
    }
    if (posName == 'Power Forward') {
      return 'PF';
    }
    if (posName == 'Center') {
      return 'C';
    }
    return '';
  }

  // Builds each column that makes up the row of data
  Widget cardColumnBuilder(String text, String subText) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        const SizedBox(
          height: 5,
        ),
        Text(
          text,
          style: const TextStyle(fontSize: 58),
        ),
        Text(
          subText,
          style: const TextStyle(fontSize: 24, color: Colors.grey),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 95,
      width: 400,
      child: Center(
        child: Card(
          elevation: 8,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              cardColumnBuilder(age.toString(), 'Years Old'),
              cardColumnBuilder(shortenedPositionName(position), 'Position'),
              cardColumnBuilder(height.toString(), 'Height'),
              cardColumnBuilder(grade, 'Class'),
            ],
          ),
        ),
      ),
    );
  }
}
