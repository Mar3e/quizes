import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            "assets/images/quiz-logo.png",
            width: 250,
            color: const Color.fromARGB(160, 255, 255, 255),
          ),
          const SizedBox(height: 46.0),
          Text(
            'Learn flutter the fun way!',
            style: GoogleFonts.lato(
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 46.0),
          OutlinedButton.icon(
            onPressed: () => startQuiz(),
            style: ElevatedButton.styleFrom(foregroundColor: Colors.white),
            label: const Text('Start Quiz'),
            icon: const Icon(Icons.play_arrow_rounded),
          ),
        ],
      ),
    );
  }
}
