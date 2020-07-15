import 'package:flutter/material.dart';

import '../screens/selected_position_screen.dart';

// UI widget displaying the position categories on the positions screen
class PositionCard extends StatelessWidget {
  final String title;
  final String imageSrc;

  const PositionCard(
    this.title,
    this.imageSrc,
  );

  // Navigates to the position's individual page
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
    // InkWell widget to allow for user input (tap)
    return InkWell(
      // Handles user input
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
            // ClipRRect forces the child widget into a rounded rectangle shape to match the container
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                imageSrc,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            // Adding a shadow gradient to each image to make text more readable
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                height: 200,
                decoration: const BoxDecoration(
                  color: Colors.black,
                  gradient: const LinearGradient(
                      colors: [
                        Colors.black,
                        Colors.transparent,
                      ],
                      begin: FractionalOffset.bottomCenter,
                      end: FractionalOffset.center),
                ),
              ),
            ),
            // Positions the text on the stack
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
