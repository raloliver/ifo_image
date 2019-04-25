import 'package:flutter/material.dart';
import './pages/home.dart';

void main() => runApp(new DodIimage());

class DodIimage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IOF Image Picker',
      theme: ThemeData(
        primarySwatch: Colors.amber,
        primaryColor: Colors.amber,
        accentColor: Colors.amberAccent,
        canvasColor: Colors.white,
        fontFamily: 'Roboto',
      ),
      home: Home(),
    );
  }
}
