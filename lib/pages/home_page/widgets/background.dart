import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  const Background({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 13, 106, 150),
            Color.fromARGB(255, 7, 34, 56),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomRight,
        ),
      ),
    );
  }
}
