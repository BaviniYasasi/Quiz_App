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
            const SizedBox(height: 30),
            const Text(
              'Your Quiz Result',
              style: TextStyle(color: Colors.deepPurple, fontSize: 32, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Image.asset(
              'assets/images/result_image.jpg',
              width: 200,
              height: 200,
            ),
            const SizedBox(height: 20),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: summary.length,
              itemBuilder: (context, index) {
                var s = summary[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '  Question ${(s['questionIndex'] as int) + 1}: ${s['question']}',
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500,color: Colors.white),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '  Correct Answer: ${s['correct_answer']}',
                        style: const TextStyle(fontSize: 16, color: Colors.green,fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '  Your Answer: ${s['user_answer']}',
                        style: const TextStyle(fontSize: 16, color: Colors.red,fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 8),
                      const Divider(
                        color: Colors.white54,
                        thickness: 2.0,
                        height: 16.0,
                      ),
                    ],
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                onAction('start');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 12.0),
                child: Text(
                  'Restart Quiz',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
