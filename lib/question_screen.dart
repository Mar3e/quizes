import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizes/answer_button.dart';
import 'package:quizes/data/questions.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key, required this.onSelectAnswer});

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  var currentQuestionIndex = 0;

  void answerQuestion(String answer) {
    widget.onSelectAnswer(answer);
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(currentQuestion.questionText,
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                    color: Colors.white,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold)),
            const SizedBox(height: 30.0),
            ...currentQuestion.getShuffledAnswers.map(
              (answer) => AnswerButton(
                answer,
                () => answerQuestion(answer),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
