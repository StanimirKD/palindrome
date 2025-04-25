import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

//This file holds multiple classes. It is my personal preference to put
//the state and the classes of the state in the same file as the cubit
//itself(if those classes won't be used elsewhere)

//A class that holds each history entry. It holds a string(what the user entered) and a boolean(if the word is a palindrome or not)
class PalindromeResult {
  final String input;
  final bool isPalindrome;

  PalindromeResult(this.input, this.isPalindrome);

  //Converting my data to json in order to save it to SharedPreferences
  Map<String, dynamic> toJson() => {
    'input': input,
    'isPalindrome': isPalindrome,
  };

  //Converting my json back to an entry in order show the previous history.
  factory PalindromeResult.fromJson(Map<String, dynamic> json) {
    return PalindromeResult(json['input'], json['isPalindrome']);
  }
}

//The state of the cubit
class PalindromeState {
  final String resultMessage;
  final List<PalindromeResult> history;

  PalindromeState({required this.resultMessage, required this.history});

  //allowing state.copyWith()
  PalindromeState copyWith({
    String? resultMessage,
    List<PalindromeResult>? history,
  }) {
    return PalindromeState(
      resultMessage: resultMessage ?? this.resultMessage,
      history: history ?? this.history,
    );
  }
}

class PalindromeCubit extends Cubit<PalindromeState> {
  PalindromeCubit() : super(PalindromeState(resultMessage: '', history: [])) {
    _loadHistory();
  }

  void check(String input) {
    //ignoring spaces to allow phrases like 'race car' to be palindromes
    final cleaned = input.toLowerCase().replaceAll(RegExp(r'\W'), '');
    //if the entered string is the same spelled backwards, then it is a palindrome
    final isPalindrome = cleaned == cleaned.split('').reversed.join();

    final result = PalindromeResult(input, isPalindrome);
    final newHistory = [result, ...state.history];

    final message =
        isPalindrome
            ? '✅ "$input" is a palindrome!'
            : '❌ "$input" is not a palindrome.';

    emit(state.copyWith(resultMessage: message, history: newHistory));
    _saveHistory(newHistory);
  }

  void clearHistory() {
    emit(state.copyWith(history: [], resultMessage: ""));
    _saveHistory([]);
  }

  Future<void> _saveHistory(List<PalindromeResult> history) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonList = history.map((r) => r.toJson()).toList();
    prefs.setString('palindrome_history', jsonEncode(jsonList));
  }

  Future<void> _loadHistory() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonStr = prefs.getString('palindrome_history');
    if (jsonStr != null) {
      final List decoded = jsonDecode(jsonStr);
      final history = decoded.map((e) => PalindromeResult.fromJson(e)).toList();
      emit(state.copyWith(history: history));
    }
  }
}

//making a reference to the cubit to allow palindromeCubit.check(), palindromeCubit.clearHistory(), etc easily.
final palindromeCubit = PalindromeCubit();
