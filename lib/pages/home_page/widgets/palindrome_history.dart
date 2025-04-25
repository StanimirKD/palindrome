import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:palindrome_assignment/cubits/palindrome_cubit.dart';

class PalindromeHistoryList extends StatelessWidget {
  const PalindromeHistoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PalindromeCubit, PalindromeState>(
      builder: (context, state) {
        if (state.history.isEmpty) {
          return Text('No history yet.', style: TextStyle(color: Colors.white));
        }
        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: state.history.length,
          itemBuilder: (context, index) {
            final item = state.history[index];
            //in a real application, I would probably make a reusable widget using a container with the
            //app's styling
            return Card(
              child: ListTile(
                title: Text(item.input, overflow: TextOverflow.ellipsis),
                trailing: Icon(
                  item.isPalindrome ? Icons.check : Icons.close,
                  color: item.isPalindrome ? Colors.green : Colors.red,
                ),
              ),
            );
          },
        );
      },
    );
  }
}
