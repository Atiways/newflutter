import 'package:final_form/constant/colors.dart';
import 'package:final_form/screens/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Chat',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}
