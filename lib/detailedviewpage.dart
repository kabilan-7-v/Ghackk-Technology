import 'package:flutter/material.dart';

class Detailedviewpage extends StatelessWidget {
  const Detailedviewpage(
      {super.key, required this.img, required this.desc, required this.tittle});
  final String img;
  final String desc;
  final String tittle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(tittle),
      ),
      body: SingleChildScrollView(
          child: Column(children: [
        Image.asset(img),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            desc,
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
        )
      ])),
    );
  }
}
