import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/questions.dart';
import 'package:flutter_application_1/quiz.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await loadQuestions();
  runApp(const Quiz());
}
