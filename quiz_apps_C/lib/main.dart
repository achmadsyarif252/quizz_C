import 'dart:ui';
import 'package:flutter/material.dart';
import '../widgets/question.dart';
import '../widgets/end_page_quiz.dart';
import '../widgets/answ_button.dart';
import '../widgets/question_widgets.dart';

/*
* File utama dimana list dari pertanyaan,
* fungsi next,reset
* */

//Membuat method yg pertama kali dijalankan
void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Quiz(),
      title: 'Flutter Quiz',
    ),
  );
}

//class induk untuk aplikasi quiz
class Quiz extends StatefulWidget {
  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  //deklarasi list pertanyaan dimana didalamya berisi map,yang isi dari mapnya berupa list dari map lagi :v

  var _question = [
    {
      'questionTxt': 'Jumlah Penduduk di indonesia..?',
      'answer': [
        {'answerTxt': '270 Juta Jiwa', 'score': 10},
        {'answerTxt': '190 Juta Jiwa', 'score': 0},
        {'answerTxt': '180 Juta Jiwa', 'score': 0},
        {'answerTxt': '160 Juta Jiwa', 'score': 0}
      ]
    },
    {
      'questionTxt': 'Framewrok Java Untuk Pemrograman Web adalah.....',
      'answer': [
        {'answerTxt': 'Spring', 'score': 0},
        {'answerTxt': 'Scala', 'score': 0},
        {'answerTxt': 'Ruby', 'score': 0},
        {'answerTxt': 'Spring Boot', 'score': 10}
      ],
    },
    {
      'questionTxt': 'Negara di ASEAN dengan pendapatan kapita terbesar...?',
      'answer': [
        {'answerTxt': 'Indonesia', 'score': 0},
        {'answerTxt': 'Singapura', 'score': 10},
        {'answerTxt': 'Malaysia', 'score': 0},
        {'answerTxt': 'Thailand', 'score': 0}
      ],
    },
    {
      'questionTxt': 'Bagian otak yang mengatur kebiasaan manusia',
      'answer': [
        {'answerTxt': 'Ganglia Basal', 'score': 10},
        {'answerTxt': 'Hipocampus', 'score': 0},
        {'answerTxt': 'Pre Frontal Cortext', 'score': 0},
        {'answerTxt': 'Cerebelum', 'score': 0}
      ]
    },
    {
      'questionTxt': 'Peramban di negara china adalah ...?',
      'answer': [
        {'answerTxt': 'Firefox', 'score': 0},
        {'answerTxt': 'Baidu', 'score': 10},
        {'answerTxt': 'Mozila', 'score': 0},
        {'answerTxt': 'UC', 'score': 0}
      ]
    },
  ];
  /*
  * Deklarasi :
  * index pertanyaan
  * total score
  * method nextQuestion
  * method reset Quiz
  *
  * */
  int _questionIndex = 0;
  int _totalScore = 0;
  void _nextQuestion(int score) {
    setState(() {
      _totalScore += score;
      _questionIndex++;
    });
  }

  void _reset() {
    setState(() {
      _totalScore = 0;
      _questionIndex = 0;
    });
  }

  //Method build quizz
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Apps'),
      ),
      body: _questionIndex < _question.length
          //Lakukan ternay operator,jika indexSoal kurang dari jumlah soal,maka
          ? QuestionWidget(_questionIndex,_question,_nextQuestion)//Memanggil Widget QuestionWidget dg parameter index,soal,dan fungsi nextquest
          : EndPageQuiz(_reset, _totalScore, _question),//panggil widget akhir quiz jika sudah mencapai akhir game dg paramter total score,reset dan soal
    );
  }
}

