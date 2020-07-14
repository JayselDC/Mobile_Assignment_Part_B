import 'package:flutter/material.dart';

import '../screens/selected_position_screen.dart';

class PositionCard extends StatelessWidget {
  final String title;
  final String imageSrc;

  const PositionCard(
    this.title,
    this.imageSrc,
  );

  void selectPosition(BuildContext context) {
    Navigator.of(context).pushNamed(
      SelectedPositionScreen.route,
      arguments: {
        'positionName': title,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectPosition(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 10,
        margin: EdgeInsets.only(
          top: 10,
          bottom: 5,
          left: 15,
          right: 15,
        ),
        child: Stack(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                imageSrc,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.black,
                  gradient: LinearGradient(
                      colors: [
                        Colors.black,
                        Colors.transparent,
                      ],
                      begin: FractionalOffset.bottomCenter,
                      end: FractionalOffset.center),
                ),
              ),
            ),
            Positioned(
              bottom: 15,
              right: 15,
              child: Text(
                title,
                style: Theme.of(context).textTheme.headline1,
              ),
            )
          ],
        ),
      ),
    );
  }
}
