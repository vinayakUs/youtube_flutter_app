import 'package:flutter/material.dart';
import 'routes/mainscreen.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(iconTheme: IconThemeData( color: Colors.grey[700])),
        primaryIconTheme: IconThemeData(color: Colors.red)
      ),
      title: 'Youtube',
      home: Homescreen(),
    );
  }
}