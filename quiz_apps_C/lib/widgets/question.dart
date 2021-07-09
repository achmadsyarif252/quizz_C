import 'package:flutter/material.dart';

/*
* Class untuk Textpertanyaan dengan parameter yg harus diisi index dan list soal
* */
class Questions extends StatelessWidget {
  final int index;
  final List<Map<String,Object>> soal;
  Questions(this.index,this.soal);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:CrossAxisAlignment.start,
      children:[
        Container(
          margin: const EdgeInsets.only(left: 5.0, bottom: 30.0),
          child: Text(
              'Soal ke ${index + 1}/${soal.length}'),
        ),
        Center(
          child: Text(
            (soal[index]['questionTxt'] as String),//cara menampilkan spesifik teks dari sebuah list dari map
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ]
    );
  }
}

