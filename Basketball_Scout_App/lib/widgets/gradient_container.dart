import 'package:flutter/material.dart';

// Simple container using a gradient for player detail aesthetics (only use case so far)
class GradientContainer extends StatelessWidget {
  final double height;
  final double width;
  final List<Color> colours;

  GradientContainer(
    this.height,
    this.width,
    this.colours,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: colours,
          // Determines the direction of the gradient
          begin: FractionalOffset.bottomCenter,
          end: FractionalOffset.topCenter,
          stops: [0, 0.9],
        ),
      ),
    );
  }
}
