import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  const Answer({super.key, required this.value, required this.onAnswer});

  final String value;
  final Function() onAnswer;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: ElevatedButton(
        onPressed: onAnswer,
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: const Color.fromARGB(255, 93, 0, 110),
        ),
        child: Text(
          value,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}