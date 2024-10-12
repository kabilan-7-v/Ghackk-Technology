// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:ghackk/detailedviewpage.dart';
import 'package:ghackk/models/blog.dart';
import 'package:like_button/like_button.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String>? likes;
  List<String>? rating;

  double value = 5;
  @override
  void initState() {
    initpref();
    super.initState();
  }

  initpref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    likes = prefs.getStringList('likes');
    rating = prefs.getStringList('rating');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: const Icon(Icons.menu),
          title: Image.asset("assect/img/logo.png"),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search),
            ),
            const SizedBox(
              width: 15,
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height - 70,
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: Provider.of<Bloglst>(context).blog.length,
                    itemBuilder: (context, ind) {
                      List<Blog> res = Provider.of<Bloglst>(context).blog;
                      return customcontainer(res[ind].img, res[ind].title,
                          context, ind, res[ind].des);
                    }),
              ),
            ],
          ),
        ));
  }

  customcontainer(
      String img, String tittle, BuildContext context, int ind, String des) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRect(
        child: Container(
          height: MediaQuery.of(context).size.height < 450 ? 580 : 320,
          width: MediaQuery.of(context).size.width - 30,
          decoration: BoxDecoration(color: Colors.grey[200]),
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Detailedviewpage(
                              img: img,
                              desc: des,
                              tittle: tittle,
                              rate: double.parse(rating![ind]))));
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(img),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                tittle,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  LikeButton(
                    padding: EdgeInsets.zero,
                    isLiked: likes != null && likes![ind] == "0" ? false : true,
                    onTap: (isLiked) async {
                      if (likes != null) {
                        if (isLiked) {
                          likes![ind] = "0";
                          setState(() {});
                        } else {
                          likes![ind] = "1";
                          setState(() {});
                        }
                        SharedPreferences prefs =
                            await SharedPreferences.getInstance();

                        prefs.setStringList("likes", likes!);

                        return likes![ind] == "0" ? false : true;
                      } else {
                        return true;
                      }
                    },
                  ),
                  RatingStars(
                    axis: Axis.horizontal,
                    value: rating != null ? double.parse(rating![ind]) : 0.0,
                    onValueChanged: (v) async {
                      if (rating != null) {
                        rating![ind] = v.toString();

                        SharedPreferences prefs =
                            await SharedPreferences.getInstance();

                        prefs.setStringList("rating", rating!);
                        setState(() {});
                      }
                    },
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
                    starOffColor: const Color.fromARGB(255, 148, 148, 150),
                    starColor: const Color.fromARGB(255, 247, 223, 8),
                    angle: 12,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
