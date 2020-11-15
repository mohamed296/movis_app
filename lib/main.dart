import 'package:flutter/material.dart';
import 'package:movis_app/helpers/constant.dart';
import 'package:movis_app/screens/HomeScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Moovies',
      theme: ThemeData(
        primarySwatch: Constant.color,
        accentColor: Color.fromRGBO(245, 195, 15, 1),
        scaffoldBackgroundColor: Constant.color,
        textTheme: TextTheme(
          headline6: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.grey[600],
          ),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
    );
  }
}
