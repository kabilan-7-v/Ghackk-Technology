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
  bool isLoading = true;
  @override
  void initState() {
    // TODO: implement initState
    storefavorites();

    super.initState();
  }

  storefavorites() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

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
    if (prefs.getStringList('rating') == null) {
      prefs.setStringList('rating', [
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
    isLoading = false;

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
