import 'package:flutter/material.dart';
import 'package:spotify_demo/screens/main_Screen.dart';
import 'package:spotify_demo/screens/main_Screen2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Spotify Demo',
      home:  MainScreen(),
    );
  }
}
