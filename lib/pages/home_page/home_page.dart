import 'package:flutter/material.dart';
import 'package:palindrome_assignment/constants.dart';
import 'package:palindrome_assignment/pages/home_page/widgets/background.dart';
import 'package:palindrome_assignment/pages/home_page/widgets/header_bar.dart';
import 'package:palindrome_assignment/pages/home_page/widgets/history_header.dart';
import 'package:palindrome_assignment/pages/home_page/widgets/palindrome_history.dart';
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
            padding: EdgeInsets.all(edgePadding),
            child: Column(
              children: const [
                HeaderBar(),
                SizedBox(height: 20),
                PalindromeInput(),
                SizedBox(height: 20),
                PalindromeResultText(),
                SizedBox(height: 20),
                HistoryHeader(),
                SizedBox(height: 20),
                PalindromeHistoryList(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
