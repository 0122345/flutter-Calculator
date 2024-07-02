import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:calculator/home_page.dart';
import 'package:calculator/util/theme_data.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      initial: AdaptiveThemeMode.system,
       light: lightTheme,
       dark: darkTheme,
       builder: (light, dark ) =>

         MaterialApp(
        debugShowCheckedModeBanner: false,
        debugShowMaterialGrid: false,
        title: 'Calculator',
        theme: light,
        darkTheme: dark,
         
       home:  const HomePage(),  
      ),
      
    );
  }
}
//
 