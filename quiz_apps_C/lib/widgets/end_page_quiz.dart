import 'package:flutter/material.dart';

class EndPageQuiz extends StatelessWidget {
  final Function reset;
  final List soal;
  final int score;
  EndPageQuiz(this.reset, this.score, this.soal);
  String? congrtsWord;

  /*
  * Class unutk akhir dari quizz dengan paramter yg harus diisi adalah reset,soal2,score
  * */

  //Pembuatan getter untuk menentukan preedikat siswa
  String get predikat {
    if (score == (soal.length * 10))
      congrtsWord = "Sempurna";
    else if (score > 30)
      congrtsWord = "Super Bagus";
    else if (score > 20)
      congrtsWord = "Bagus Sekali";
    else if (score > 10)
      congrtsWord = "Bagus";
    else
      congrtsWord = "Tetap Semangat Belajar!";
    return congrtsWord!;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Congratss..You have been ended the quiz',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 50,
          ),
          Text(
            "Your Score : ${score} of ${soal.length * 10}",
            style: TextStyle(
              fontSize: 15.0,
              color: Colors.grey,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            predikat,
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Container(
            width: double.infinity,
            margin:
            const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
            child: MaterialButton(
              onPressed: () {
                reset();
              },
              textColor: Colors.white,
              color: Colors.blue,
              child: Text('Reset'),
            ),
          ),
        ],
      ),
    );
  }
}
