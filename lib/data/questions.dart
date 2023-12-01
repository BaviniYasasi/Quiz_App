import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/models/quiz_questions.dart';

List<QuizQuestion> questions = [];

Future<void> loadQuestions() async {
  try {
    final String response =
        await rootBundle.loadString('assets/json/questions.json');
    final List<dynamic> data = json.decode(response)['questionsAll'];

    questions = data
        .map((item) => QuizQuestion(
              item["question"] as String,
              (item["answers"] as List<dynamic>).cast<String>(),
            ))
        .toList();
  } catch (e) {
    if (kDebugMode) {
      print('Error loading questions: $e');
    }
  }
}
