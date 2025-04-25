import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:palindrome_assignment/cubits/palindrome_cubit.dart';

void main() {
  runApp(const PalindromeApp());
}

class PalindromeApp extends StatelessWidget {
  const PalindromeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PalindromeCubit>(
      create: (_) => palindromeCubit,
      child: MaterialApp(
        title: 'Palindrome Checker',
        home: const Material(child: SizedBox()),
      ),
    );
  }
}
