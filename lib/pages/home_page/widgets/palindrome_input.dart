import 'package:flutter/material.dart';
import 'package:palindrome_assignment/constants.dart';
import 'package:palindrome_assignment/cubits/palindrome_cubit.dart';

//using a stateful widget to avoid memory leaks related to the text editting
//controller(did not want to initialize it in the build method, and I wanted to have the on dispose)
class PalindromeInput extends StatefulWidget {
  const PalindromeInput({super.key});

  @override
  State<PalindromeInput> createState() => _PalindromeInputState();
}

class _PalindromeInputState extends State<PalindromeInput> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        TextField(
          controller: _controller,
          decoration: InputDecoration(
            filled: true,
            fillColor: nearlyWhite,
            hintText: 'Enter a word or phrase',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {
            final text = _controller.text.trim();
            if (text.isNotEmpty) {
              palindromeCubit.check(text);
              _controller.clear();
            }
          },
          child: FittedBox(
            child: Text(
              'Check',
              style: theme.textTheme.bodyMedium?.copyWith(color: nearlyBlack),
            ),
          ),
        ),
      ],
    );
  }
}
