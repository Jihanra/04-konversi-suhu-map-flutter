import 'package:flutter/material.dart';
//Jihan Rahadatul Aisy (2031710034)

class Convert extends StatelessWidget {
  const Convert({Key? key, required this.konversi}) : super(key: key);

  final VoidCallback konversi;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500,
      height: 35,
      margin: const EdgeInsets.only(bottom: 20),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.lightGreen,
          textStyle: const TextStyle(color: Colors.white),
        ),
        onPressed: konversi,
        child: const Text("Konversi Suhu", style: TextStyle(fontSize: 20)),
      ),
    );
  }
}
