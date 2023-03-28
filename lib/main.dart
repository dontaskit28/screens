import 'package:flutter/material.dart';
import 'package:screens/review.dart';
import 'home.dart';

void main() {
  runApp(const MyApp());
}

// Another Page review page

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Screens',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      home: const TabPage(),
    );
  }
}
