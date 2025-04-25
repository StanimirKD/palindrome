import 'package:flutter/material.dart';
import 'package:palindrome_assignment/constants.dart';

class Background extends StatelessWidget {
  const Background({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [lightBlue, nightBlue],
          begin: Alignment.topCenter,
          end: Alignment.bottomRight,
        ),
      ),
    );
  }
}
