import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:sicuritalia_app_flutter/ui/screens/homepage_screen.dart';
import 'package:sicuritalia_app_flutter/utils/stores/bottom_bar_store.dart';
import 'package:sicuritalia_app_flutter/utils/theme/custom_theme.dart';

class ScaffoldApp extends StatefulWidget {
  const ScaffoldApp({Key? key}) : super(key: key);

  @override
  State<ScaffoldApp> createState() => _ScaffoldAppState();
}

class _ScaffoldAppState extends State<ScaffoldApp> {
  final bottomBarStore = BottomBarStore();
  List<String> _listTitle = ['Dashboard', 'Avvisi', 'Aiuto', 'Chat', 'Profilo'];
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
    bottomBarStore.change(index);
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
        builder: (context) => Scaffold(
            appBar: AppBar(
              actions: [
                GestureDetector(
            onTap: () {
              //Navigator.of(context).pop();

            },
            child: Padding(padding: EdgeInsets.all(4), child: CircleAvatar(
  backgroundImage:
      NetworkImage('https://picsum.photos/id/237/200/300'),
)
          ),)
                   
              ],
              backgroundColor: CustomColor.primaryColor,
              centerTitle: false,
              title: Text(_listTitle[bottomBarStore.selectedIndex],
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
            ),
            body:  _listPage[bottomBarStore.selectedIndex],
            
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
                  icon: Icon(CupertinoIcons.settings),
                  label: 'School',
                ),
              ],
              currentIndex: bottomBarStore.selectedIndex,
              onTap: _onItemTapped,
            )));
  }
}
