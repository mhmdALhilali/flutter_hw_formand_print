import 'package:flutter/material.dart';
import 'screens/form_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Complete Form Example',
      home: FormScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
