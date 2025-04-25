import 'package:flutter/material.dart';
import 'package:palindrome_assignment/pages/home_page/widgets/background.dart';
import 'package:palindrome_assignment/pages/home_page/widgets/header_bar.dart';
import 'package:palindrome_assignment/pages/home_page/widgets/palindrome_input.dart';
import 'package:palindrome_assignment/pages/home_page/widgets/palindrome_result.dart';

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
            child: Column(
              children: const [
                HeaderBar(),
                SizedBox(height: 20),
                PalindromeInput(),
                SizedBox(height: 20),
                PalindromeResultText(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
