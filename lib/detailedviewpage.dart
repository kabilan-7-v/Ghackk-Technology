import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';

class Detailedviewpage extends StatelessWidget {
  const Detailedviewpage(
      {super.key,
      required this.img,
      required this.desc,
      required this.tittle,
      required this.rate});
  final String img;
  final String desc;
  final String tittle;
  final double rate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(tittle),
        actions: [
          RatingStars(
            axis: Axis.horizontal,
            value: rate,
            starCount: 5,
            starSize: 20,
            valueLabelColor: const Color(0xff9b9b9b),
            valueLabelTextStyle: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
                fontSize: 12.0),
            valueLabelRadius: 10,
            maxValue: 5,
            starSpacing: 2,
            maxValueVisibility: true,
            valueLabelVisibility: true,
            animationDuration: Duration(milliseconds: 1000),
            valueLabelPadding:
                const EdgeInsets.symmetric(vertical: 1, horizontal: 8),
            valueLabelMargin: const EdgeInsets.only(right: 8),
            starOffColor: const Color.fromARGB(255, 141, 141, 143),
            starColor: const Color.fromARGB(255, 247, 223, 8),
            angle: 12,
          ),
          SizedBox(
            width: 8,
          )
        ],
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
