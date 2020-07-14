import 'package:flutter/material.dart';

class Player {
  final String id;
  final String name;
  final int age;
  final String position;
  final int height;
  final int contactNumber;
  final String grade;
  final String image;

  const Player({
    @required this.id,
    @required this.name,
    @required this.age,
    @required this.position,
    @required this.height,
    @required this.contactNumber,
    @required this.grade,
    this.image
  });
}
