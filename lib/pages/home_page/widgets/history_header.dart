import 'package:flutter/material.dart';
import 'package:palindrome_assignment/constants.dart';
import 'package:palindrome_assignment/cubits/palindrome_cubit.dart';

class HistoryHeader extends StatelessWidget {
  const HistoryHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //Using Flexible within the row to ensure no overflows with smaller screens
        Flexible(
          flex: 4,
          //using fitted box to scale down the text if the screen is too small horizontally
          //and not send the text on a 2nd row
          child: FittedBox(
            child: Text(
              'History',
              style: theme.textTheme.titleLarge?.copyWith(
                color: nearlyWhite,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Flexible(
          child: IconButton(
            onPressed: palindromeCubit.clearHistory,
            icon: Icon(Icons.delete, color: nearlyWhite),
          ),
        ),
      ],
    );
  }
}
