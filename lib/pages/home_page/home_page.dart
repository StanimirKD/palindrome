import 'package:flutter/material.dart';
import 'package:palindrome_assignment/pages/home_page/widgets/background.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Background(),
        SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(20),
            child: Container(color: Colors.red, width: 200, height: 200),
            //foreground,
          ),
        ),
      ],
    );
  }
}
