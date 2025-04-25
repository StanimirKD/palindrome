import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:palindrome_assignment/cubits/palindrome_cubit.dart';
import 'package:palindrome_assignment/pages/home_page/home_page.dart';

void main() {
  runApp(const PalindromeApp());
}

class PalindromeApp extends StatelessWidget {
  const PalindromeApp({super.key});

  @override
  Widget build(BuildContext context) {
    //Using multi bloc provider in case there is need to add more cubits in the future. For the purposes of this test,
    //a standard bloc provider would have achieved the same result.
    return MultiBlocProvider(
      providers: [
        BlocProvider<PalindromeCubit>(create: (_) => palindromeCubit),
      ],
      child: MaterialApp(
        title: 'Palindrome Checker',
        home: const Material(child: HomePage()),
      ),
    );
  }
}
