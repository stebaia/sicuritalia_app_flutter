import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sicuritalia_app_flutter/ui/screens/homepage_screen.dart';
import 'package:sicuritalia_app_flutter/utils/theme/custom_theme.dart';

class ScaffoldApp extends StatefulWidget {
  const ScaffoldApp({Key? key}) : super(key: key);

  @override
  State<ScaffoldApp> createState() => _ScaffoldAppState();
}

class _ScaffoldAppState extends State<ScaffoldApp> {
  int _selectedIndex = 0;

  List<Widget> _listPage = [
    HomepageScreen(),
    Center(
      child: Text('Avvisi'),
    ),
    Center(
      child: Text('Aiuto'),
    ),
    Center(
      child: Text('Chat'),
    ),
    Center(
      child: Text('Utente'),
    )
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          child: _listPage[_selectedIndex],
        ),
        bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: CustomColor.secondaryColor,
          unselectedItemColor: CustomColor.colorSecondaryGrary,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.news),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.exclamationmark_shield),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.bubble_left),
              label: 'Business',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.person),
              label: 'School',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ));
  }
}
