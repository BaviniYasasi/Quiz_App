import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/questions.dart';
import 'package:flutter_application_1/question_screen.dart';
import 'package:flutter_application_1/result_screen.dart';
import 'package:flutter_application_1/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  String activeScreen = 'start';
  List<String> selectedAnswers = [];

  // @override
  // void initState() {
  //   activeScreen = StartScreen(
  //     onAction: onScreenChange,
  //   );
  //   super.initState();
  // }

  void onScreenChange(String value) {
    setState(() {
      activeScreen = value;
    });
  }

  void onAnswerSelect(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'result';
      });
    }
  }

  void onRestart(String value) {
    setState(() {
      selectedAnswers = [];
      activeScreen = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget? currentScreen = StartScreen(onAction: onScreenChange);

    if (activeScreen == 'start') {
      currentScreen = StartScreen(onAction: onScreenChange);
    }

    if (activeScreen == 'quiz') {
      currentScreen =
          QuestionScreen(onAnswer: onAnswerSelect, onAction: onScreenChange);
    }

    if (activeScreen == 'result') {
      currentScreen =
          ResultScreen(onAction: onRestart, answerList: selectedAnswers);
    }

    return MaterialApp(
      home: Scaffold(
          body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.black, Colors.black87],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
        ),
        child: currentScreen,
      )),
    );
  }
}