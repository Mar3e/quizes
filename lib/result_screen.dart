import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizes/data/questions.dart';
import 'package:quizes/questions_summery.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    super.key,
    required this.chosenAnswers,
    required this.onTap,
  });

  final List<String> chosenAnswers;
  final void Function() onTap;

  List<Map<String, Object>> getSummeryDate() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].questionText,
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAnswers[i],
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summeryDate = getSummeryDate();
    final totalQuestionsNum = questions.length;
    final correctAnswerNum = summeryDate
        .where((element) => element['correct_answer'] == element['user_answer'])
        .length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $correctAnswerNum out of $totalQuestionsNum questions correctly!',
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 20.0,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30.0),
            QuestionsSummery(summeryDate),
            const SizedBox(height: 30.0),
            OutlinedButton.icon(
              onPressed: onTap,
              style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.white,
                  shape: const ContinuousRectangleBorder(
                    borderRadius: BorderRadiusDirectional.only(
                      topStart: Radius.circular(40.0),
                      bottomEnd: Radius.circular(40.0),
                    ),
                  )),
              label: const Text(
                'Restart Quiz!',
                style: TextStyle(fontSize: 16.0),
              ),
              icon: const Icon(Icons.restart_alt_rounded),
            ),
          ],
        ),
      ),
    );
  }
}
