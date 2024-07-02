import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:calculator/components/appbar.dart';
import 'package:calculator/components/battery.dart';
import 'package:calculator/components/calc.dart';
import 'package:calculator/components/drawer.dart';
import 'package:calculator/components/login.dart';
import 'package:calculator/components/signup.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
 
class HomePage extends StatefulWidget {
    const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static const List<Widget> _pages = [
    Calculator(),
    LoginPage(),
    SignUpPage(),
    BatteryLevel(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _showThemeDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Change Theme',
           style: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
            fontSize: 20,
            color: Color.fromARGB(255, 219, 7, 202),
           ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                title: const Text('Light theme'),
                leading: Radio(
                  value: AdaptiveThemeMode.light,
                  groupValue: AdaptiveTheme.of(context).mode,
                  onChanged: (AdaptiveThemeMode? mode) {
                    AdaptiveTheme.of(context).setThemeMode(mode!);
                    Navigator.pop(context);
                  },
                ),
              ),
              ListTile(
                title: const Text('Dark theme'),
                leading: Radio(
                  value: AdaptiveThemeMode.dark,
                  groupValue: AdaptiveTheme.of(context).mode,
                  onChanged: (AdaptiveThemeMode? mode) {
                    AdaptiveTheme.of(context).setThemeMode(mode!);
                    Navigator.pop(context);
                  },
                ),
              ),
              ListTile(
                title: const Text('System theme'),
                leading: Radio(
                  value: AdaptiveThemeMode.system,
                  groupValue: AdaptiveTheme.of(context).mode,
                  onChanged: (AdaptiveThemeMode? mode) {
                    AdaptiveTheme.of(context).setThemeMode(mode!);
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
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
              tabBackgroundColor: Theme.of(context).primaryColor,
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
                GButton(
                  icon: Icons.battery_alert,
                  text: 'Battery Level',
                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: _onItemTapped,
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.green,
          foregroundColor: Colors.white,
          elevation: 10,
          shape: const CircleBorder(),
          mini: true,
          tooltip: 'Change Theme man it needs to be changed!!😎',
          onPressed: () {
            _showThemeDialog(context);
          },
          child: Icon(
            AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark
                ? Icons.light_mode
                : Icons.dark_mode,
          ),
        ),
      ),
    );
  }
}



