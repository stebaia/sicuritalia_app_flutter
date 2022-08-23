import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:sicuritalia_app_flutter/utils/providers/navigation_bar_provider.dart';

import '../../utils/providers/tab_controller_provider.dart';
import '../../utils/stores/bottom_bar_store.dart';
import '../../utils/theme/custom_theme.dart';

class HomepageScreen extends StatelessWidget {
  HomepageScreen({Key? key}) : super(key: key);
  final bottomBarStore = BottomBarStore();
  @override
  Widget build(BuildContext context) {

    final _screenindexprovider = Provider.of<BottomNavigationBarProvider>(context);
    int currentScreenIndex = _screenindexprovider.currentIndex;

    final _tabIndex = Provider.of<TabControllerProvider>(context);
    int currentTabIndex = _screenindexprovider.currentIndex;

    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          GridView.count(
              // Create a grid with 2 columns. If you change the scrollDirection to
              // horizontal, this produces 2 rows.
              padding: EdgeInsets.all(10),
              crossAxisCount: 2,
              shrinkWrap: true,
              childAspectRatio: 1.4,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              physics: new NeverScrollableScrollPhysics(),
              // Generate 100 widgets that display their index in the List.
              children: [
                _generateTopBox([Colors.blue, CustomColor.primaryColor],
                    "Localizzati", "Trova la tua posizione", "assets/map.png"),
                _generateTopBox(
                    [Color.fromARGB(255, 27, 117, 191), Colors.lightBlue],
                    "Telefona",
                    "Telefona a un operatore",
                    "assets/phone.png"),
                _generateTopBox([Colors.red, CustomColor.redColor], "Soccorso",
                    "Richiedi soccorso immediato", "assets/megaphone.png"),
                _generateTopBox([Colors.cyan, CustomColor.secondaryColor],
                    "Chat", "Chatta con un operatore", "assets/chat.png"),
              ]),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Allerte',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Row(
                  children: [
                    GestureDetector(
                      child: Text('Vedi Tutte >'),
                      onTap: ()  {
                        _screenindexprovider.currentIndex = 1;
                        _tabIndex.currentIndex = 0;
                      }
                    )
                    
                  ],
                )
              ],
            ),
          ),
          SizedBox(
              height: 200,
              child: ListView.builder(
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  itemCount: 4,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: ((context, index) => Container(
                        height: 200,
                        width: 200,
                        child:  Container(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Image.asset(
                                        "assets/earth.png",
                                        height: 24,
                                        colorBlendMode: BlendMode.modulate,
                                      ),
                                      SizedBox(
                                        width: 6,
                                      ),
                                      Text('LBN', style: TextStyle(fontWeight: FontWeight.bold),)
                                    ],
                                  ),
                                  Container(
                                    width: 70,
                                    child: Padding(child: Center(child: Text('Pericolo', style: TextStyle(color: Colors.white ,fontSize: 12),)),padding: EdgeInsets.only(left: 4, right: 4),),
                                    decoration: BoxDecoration(
                            
                            color: Colors.red,
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Attentato all\'aeroporto di Beirut',
                                maxLines: 3,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text('18 Ago 2022 - 18.10'),
                            ],
                          ),
                        ),
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromARGB(255, 191, 187, 187)
                                    .withOpacity(0.3),
                                spreadRadius: 3,
                                blurRadius: 5,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        margin: EdgeInsets.only(left: 10, right: 10),
                      )))),
          Padding(
            padding: EdgeInsets.only(left: 10, right: 10, top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'News',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Row(
                  children: [GestureDetector(
                      child: Text('Vedi Tutte >'),
                      onTap: ()  {
                        _screenindexprovider.currentIndex = 1;
                        _tabIndex.currentIndex = 1;
                      }
                    )],
                )
              ],
            ),
          ),
          SizedBox(
              height: 200,
              child: ListView.builder(
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  itemCount: 4,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: ((context, index) => Container(
                        height: 200,
                        width: 200,
                        child: Container(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                    children: [
                                      Icon(CupertinoIcons.news_solid, color: Colors.blue,),
                                      SizedBox(
                                        width: 6,
                                      ),
                                      Text('Libia',)
                                    ],
                                  ),
                              Text(
                                'Oim, 193 migranti riportati a terra in 7 giorni',
                                maxLines: 3,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text('18 Ago 2022 - 18.10'),
                            ],
                          ),
                        ),
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromARGB(255, 191, 187, 187)
                                    .withOpacity(0.3),
                                spreadRadius: 3,
                                blurRadius: 5,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        margin: EdgeInsets.only(left: 10, right: 10),
                      ))))
        ],
      )),
    );
  }

  Widget _generateTopBox(
      List<Color> gradient, String title, String subtitle, String image) {
    return Container(
        child: Stack(
          children: [
            Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    Text(
                      subtitle,
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    )
                  ],
                )),
            Positioned(
                top: 10,
                left: 80,
                child: Container(
                    alignment: Alignment.centerRight,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Image.asset(
                      image,
                      height: 110,
                      color: Colors.white.withOpacity(0.2),
                      colorBlendMode: BlendMode.modulate,
                    )))
          ],
        ),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: gradient),
            boxShadow: [
              BoxShadow(
                color: Color.fromARGB(255, 218, 172, 172).withOpacity(0.3),
                spreadRadius: 3,
                blurRadius: 5,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
            borderRadius: BorderRadius.all(Radius.circular(20))),
        margin: EdgeInsets.only(left: 10, right: 10));
  }
}
