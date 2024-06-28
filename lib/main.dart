//import 'package:calculator/components/login.dart';
import 'package:calculator/home_page.dart';
//import 'package:calculator/components/signup.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      title: 'Calculator',
      theme: ThemeData(
        fontFamily: 'Michelle',
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 1, 9, 133)),
        useMaterial3: true,
      ),
      home: const HomePage(),  
    );
  }
}
//