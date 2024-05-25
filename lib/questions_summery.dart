import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsSummery extends StatelessWidget {
  const QuestionsSummery(this.summeryData, {super.key});

  final List<Map<String, Object>> summeryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summeryData
              .map(
                (element) => Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: (element['user_answer'] ==
                                  element['correct_answer'])
                              ? Colors.lightGreen
                              : Colors.orangeAccent),
                      child: Text(
                        ((element["question_index"] as int) + 1).toString(),
                        style: const TextStyle(
                          fontSize: 16.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8.0),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            element['question'] as String,
                            // textAlign: TextAlign.center,
                            style: GoogleFonts.lato(
                                fontSize: 16.0,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 5.0),
                          Text(
                            element['user_answer'] as String,
                            style: const TextStyle(
                              color: Colors.amber,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 5.0),
                          Text(
                            element['correct_answer'] as String,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(
                                  255,
                                  82,
                                  255,
                                  87,
                                )),
                          ),
                          const SizedBox(height: 16.0)
                        ],
                      ),
                    ),
                  ],
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
