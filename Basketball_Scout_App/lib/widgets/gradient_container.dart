import 'package:flutter/material.dart';

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
          begin: FractionalOffset.bottomCenter,
          end: FractionalOffset.topCenter,
          stops: [0, 0.9],
        ),
      ),
    );
  }
}
