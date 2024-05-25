import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton(
    this.answerText,
    this.onPressed, {
    super.key,
  });
  final String answerText;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8.0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(
              horizontal: 36.0,
              vertical: 16.0,
            ),
            backgroundColor: const Color.fromARGB(255, 76, 175, 125),
            foregroundColor: const Color.fromARGB(222, 255, 255, 255),
            shape: const ContinuousRectangleBorder(
              borderRadius: BorderRadiusDirectional.only(
                topStart: Radius.circular(40.0),
                bottomEnd: Radius.circular(40.0),
              ),
            )),
        child: Text(
          answerText,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
