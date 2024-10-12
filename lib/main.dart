import 'package:flutter/material.dart';
import 'package:ghackk/home_page.dart';
import 'package:ghackk/models/blog.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  bool? like1;
  bool? like2;
  bool? like3;
  bool? like4;
  bool? like5;
  bool? like6;
  bool? like7;
  bool? like8;
  bool? like9;
  bool? like10;

  bool isLoading = true;
  @override
  void initState() {
    // TODO: implement initState
    storefavorites();

    super.initState();
  }

  storefavorites() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    isLoading = false;
    if (prefs.getStringList('likes') == null) {
      prefs.setStringList('likes', [
        '0',
        '0',
        '0',
        '0',
        '0',
        '0',
        '0',
        '0',
        '0',
        '0',
      ]);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (create) => Bloglst()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
        ),
        home: isLoading
            ? const Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              )
            : const HomePage(),
      ),
    );
  }
}
