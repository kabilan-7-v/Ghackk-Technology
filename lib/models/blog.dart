import 'package:flutter/material.dart';
import 'package:ghackk/models/src.dart';

class Blog {
  final String img;
  final String des;
  final String title;

  Blog({required this.img, required this.des, required this.title});
}

class Bloglst extends ChangeNotifier {
  List<Blog> _blog = [
    Blog(
        img: Sourceimg().img1,
        des: SourceDescription().desc1,
        title: Sourcetittle().title1),
    Blog(
        img: Sourceimg().img2,
        des: SourceDescription().desc2,
        title: Sourcetittle().title2),
    Blog(
        img: Sourceimg().img3,
        des: SourceDescription().desc3,
        title: Sourcetittle().title3),
    Blog(
        img: Sourceimg().img4,
        des: SourceDescription().desc4,
        title: Sourcetittle().title4),
    Blog(
        img: Sourceimg().img5,
        des: SourceDescription().desc5,
        title: Sourcetittle().title5),
    Blog(
        img: Sourceimg().img6,
        des: SourceDescription().desc6,
        title: Sourcetittle().title6),
    Blog(
        img: Sourceimg().img7,
        des: SourceDescription().desc7,
        title: Sourcetittle().title7),
    Blog(
        img: Sourceimg().img8,
        des: SourceDescription().desc8,
        title: Sourcetittle().title8),
    Blog(
        img: Sourceimg().img9,
        des: SourceDescription().desc9,
        title: Sourcetittle().title9),
    Blog(
        img: Sourceimg().img10,
        des: SourceDescription().desc10,
        title: Sourcetittle().title10),
  ];
  List<Blog> get blog => _blog;
}
