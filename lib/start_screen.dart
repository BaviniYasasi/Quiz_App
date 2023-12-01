import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key, required this.onAction});

  final Function(String value) onAction;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/unnamed.png',
            width: 300,
            height: 300,
          ),
          const SizedBox(
            height: 50,
          ),
          const Text(
            "Let's do some refreshment on Flutter",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white,fontSize: 28),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 15)
          ),
          OutlinedButton(
            onPressed: () {
              onAction('quiz');
            },
            style: OutlinedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 93, 0, 110),
              side: const BorderSide(
                color: Color.fromARGB(255, 93, 0, 110)
              )
            ),
            child: const Text(
              'Start Quiz',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white,fontSize: 20),
            ),
          )
        ],
      ),
    );
  }
}