import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:calculator/home_page.dart';
import 'package:calculator/util/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'dependency_injection.dart';
import 'package:flutter/services.dart';

Future<void> main() async {
  DependencyInjection.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
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
        home: const HomePage(),
      ),
    );
  }
}

 