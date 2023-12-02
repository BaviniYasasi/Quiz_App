import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/questions.dart';
import 'package:flutter_application_1/models/quiz_questions.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({Key? key, required this.answerList, required this.onAction})
      : super(key: key);

  final List<String> answerList;
  final Function(String value) onAction;

  List<Map<String, Object>> getSummary(List<QuizQuestion> questions) {
    List<Map<String, Object>> summary = [];

    for (var i = 0; i < answerList.length; i++) {
      summary.add({
        'questionIndex': i,
        'question': questions[i].question,
        'correct_answer': questions[i].answers[0],
        'user_answer': answerList[i],
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, Object>> summary = getSummary(questions);

    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Result Screen',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black, fontSize: 28, fontWeight: FontWeight.w900),
            ),
            const Padding(padding: EdgeInsets.all(18)),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: summary.length,
              itemBuilder: (context,index){
                var s = summary[index];
                return Column(
                  children: [
                    Text(
                      'Question ${(s['questionIndex'] as int) + 1}: ${s['question']}',
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Correct Answer: ${s['correct_answer']}',
                      style: const TextStyle(fontSize: 16, color: Color.fromARGB(255, 74, 242, 80),backgroundColor: Colors.black),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Your Answer: ${s['user_answer']}',
                      style: const TextStyle(fontSize: 16, color: Color.fromARGB(255, 78, 77, 77),backgroundColor: Colors.white),
                    ),
                    const SizedBox(height: 8),
                    const Divider(
                      color: Colors.grey,
                      thickness: 2.0,
                      height: 16.0,
                    ),
                  ],
                );
              },
            ),
            OutlinedButton(
              onPressed: () {
                onAction('start');
              },
              style: OutlinedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 93, 0, 110),
                side: const BorderSide(color: Color.fromARGB(255, 93, 0, 110)),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 12.0),
                child: Text(
                  'Restart',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

            