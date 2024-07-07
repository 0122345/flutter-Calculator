import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:get/get.dart';

import 'dependency_injection.dart';
import 'package:flutter/services.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:calculator/home_page.dart';
import 'package:calculator/util/theme_data.dart';
import 'package:google_sign_in/google_sign_in.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
 DependencyInjection.init(); // Assuming DependencyInjection.init() is async
  GoogleSignIn googleSignIn = GoogleSignIn();
  runApp(MyApp(googleSignIn: googleSignIn));
}

class MyApp extends StatelessWidget {
  final GoogleSignIn googleSignIn;
  const MyApp({required this.googleSignIn});
  
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
    return AdaptiveTheme(
      initial: AdaptiveThemeMode.system,
      light: lightTheme,
      dark: darkTheme,
      builder: (light, dark) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        debugShowMaterialGrid: false,
        title: 'Calculator',
        theme: light,
        darkTheme: dark,
           home: HomePage(googleSignIn: googleSignIn),
      ),
    );
  }
}

