import 'package:flutter/material.dart';

import '../widgets/position_card.dart';

class PositionsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        PositionCard('Point Guard', 'assets/images/point_guard.jpeg'),
        PositionCard('Shooting Guard', 'assets/images/shooting_guard.jpeg'),
        PositionCard('Small Forward', 'assets/images/small_forward.jpg'),
        PositionCard('Power Forward', 'assets/images/power_forward.jpg'),
        PositionCard('Center', 'assets/images/center.jpeg'),
      ],
    );
  }
}
