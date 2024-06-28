import 'package:calculator/components/appbar.dart';
import 'package:calculator/components/calc.dart';
import 'package:calculator/components/drawer.dart';
import 'package:calculator/components/login.dart';
import 'package:calculator/components/signup.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static const List<Widget> _pages = [
    Calculator(),
    LoginPage(),
    SignUpPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       drawer: const DrawerSection(),
      appBar: const Nav(),  
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        color: const Color.fromARGB(255, 4, 24, 141),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
          child: GNav(
            gap: 8,
            activeColor: Colors.white,
            color: Colors.black,
            iconSize: 24,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            duration: const Duration(milliseconds: 800),
            tabBackgroundColor: const Color.fromARGB(255, 63, 3, 173),
            tabs: const [
              GButton(
                icon: Icons.calculate,
                text: 'Calculator',
              ),
              GButton(
                icon: Icons.login,
                text: 'Login',
              ),
              GButton(
                icon: Icons.person_add,
                text: 'SignUp',
              ),
            ],
            selectedIndex: _selectedIndex,
            onTabChange: _onItemTapped,
          ),
        ),
      ),
    );
  }
}


