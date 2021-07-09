import 'package:flutter/material.dart';
import '../widgets/question.dart';
import '../widgets/answ_button.dart';

class QuestionWidget extends StatelessWidget {
  final int questionIndex;
  final List<Map<String,Object>> question;
  final Function handler;
  QuestionWidget(this.questionIndex,this.question,this.handler);//Inisialisasi konstruktor untuk kelas questionWidget

  @override
  Widget build(BuildContext context) {
    //Return container dengan isi kolom widget teks soal dan button jawaban
    return Container(
      margin: EdgeInsets.only(top: 30.0, left: 10.0, right: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Questions(questionIndex,question),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.2,
          ),
          ...(question[questionIndex]['answer']//Keluarkan map kedalam individu button kemudian dikembalikan ke list
          as List<Map<String, Object>>)
              .map((soal) {
            return AnswerButton(handler,soal);
          })
        ],
      ),
    );
  }
}
