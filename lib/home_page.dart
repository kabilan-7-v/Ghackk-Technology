// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
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
  @override
  void initState() {
    initpref();
    super.initState();
  }

  initpref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    likes = prefs.getStringList('likes');
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
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    Detailedviewpage(img: img, desc: des, tittle: tittle)));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRect(
          child: Container(
            height: MediaQuery.of(context).size.height < 450 ? 580 : 320,
            width: MediaQuery.of(context).size.width - 30,
            decoration: BoxDecoration(color: Colors.grey[200]),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(img),
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
