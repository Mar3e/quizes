import 'package:flutter/material.dart';
import 'package:quizes/data/questions.dart';
import 'package:quizes/question_screen.dart';
import 'package:quizes/result_screen.dart';
import 'package:quizes/welcome_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  final List<String> selectedAnswers = [];
  var activeScreen = 'start-screen';

  void switchScreen() {
    setState(() {
      activeScreen = 'question-screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'results-screen ';
      });
    }
  }

  void restartQuiz() {
    selectedAnswers.clear();
    setState(() {
      activeScreen = "start-screen";
    });
  }

  Widget displayScreen() {
    switch (activeScreen) {
      case 'start-screen':
        return WelcomeScreen(switchScreen);
      case 'question-screen':
        return QuestionScreen(onSelectAnswer: chooseAnswer);
      default:
        return ResultScreen(chosenAnswers: selectedAnswers, onTap: restartQuiz);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: RadialGradient(
              colors: [
                Color.fromARGB(255, 103, 194, 106),
                Color.fromARGB(255, 89, 180, 92),
                Color.fromARGB(255, 81, 158, 84),
              ],
            ),
          ),
          child: displayScreen(),
        ),
      ),
    );
  }
}
