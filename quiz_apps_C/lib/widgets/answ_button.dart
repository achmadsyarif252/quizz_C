import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  final Function handler;
  final Map<String, Object> soal;
  AnswerButton(this.handler, this.soal);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.0,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 5,
      ),
      child: MaterialButton(
        color: Colors.blue,
        textColor: Colors.white,
        onPressed: () {
          handler(soal['score'] as int);
        },
        child: Text(soal['answerTxt'] as String),
      ),
    );
  }
}
