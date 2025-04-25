import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:palindrome_assignment/cubits/palindrome_cubit.dart';

class PalindromeResultText extends StatelessWidget {
  const PalindromeResultText({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocBuilder<PalindromeCubit, PalindromeState>(
      builder: (context, state) {
        if (state.resultMessage.isEmpty) return const SizedBox();
        return Text(
          //Marking result message as non-nullable as I have that check above
          state.resultMessage,
          style: theme.textTheme.bodyMedium?.copyWith(color: Colors.white),
        );
      },
    );
  }
}
