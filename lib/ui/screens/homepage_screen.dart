import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../utils/theme/custom_theme.dart';

class HomepageScreen extends StatelessWidget {
  const HomepageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                _generateTopBox([Colors.blue, CustomColor.primaryColor],"Localizzati", "Trova la tua posizione", "assets/map.png" ),
                _generateTopBox([Colors.green, CustomColor.greenColor],"Telefona", "Telefona a un operatore", "assets/phone.png" ),
                _generateTopBox([Colors.red, CustomColor.redColor],"Soccorso", "Richiedi soccorso immediato", "assets/megaphone.png" ),
                _generateTopBox([Colors.cyan, CustomColor.secondaryColor],"Chat", "Chatta con un operatore", "assets/chat.png" ),
              ]
              ),
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
                  children: [Text('Vedi Tutte >')],
                )
              ],
            ),
          ),
          SizedBox(
              height: 200,
              child: ListView.builder(
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  itemCount: 10,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: ((context, index) => Container(
                        height: 200,
                        width: 200,
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
                  children: [Text('Vedi Tutte >')],
                )
              ],
            ),
          ),
          SizedBox(
              height: 200,
              child: ListView.builder(
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  itemCount: 10,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: ((context, index) => Container(
                        height: 200,
                        width: 200,
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
  Widget _generateTopBox(List<Color> gradient, String title, String subtitle, String image ){
    
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
                                  style: TextStyle(
                                      fontSize: 14,
                                      
                                      color: Colors.white),
                                )
                              ],
                            )),
                        Positioned(
                            top: 10,
                            left: 80,
                            child: Container(
                                alignment: Alignment.centerRight,
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
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
                            color: Color.fromARGB(255, 218, 172, 172)
                                .withOpacity(0.3),
                            spreadRadius: 3,
                            blurRadius: 5,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    margin: EdgeInsets.only(left: 10, right: 10));
  }
}
