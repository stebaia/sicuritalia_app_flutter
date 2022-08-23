import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:sicuritalia_app_flutter/utils/theme/custom_theme.dart';

import '../../utils/providers/navigation_bar_provider.dart';
import '../../utils/providers/tab_controller_provider.dart';

class AdvicePageScreen extends StatefulWidget {
  const AdvicePageScreen({Key? key}) : super(key: key);

  @override
  State<AdvicePageScreen> createState() => _AdvicePageScreenState();
}

class _AdvicePageScreenState extends State<AdvicePageScreen>
    with SingleTickerProviderStateMixin {
  TabBar get _tabBar => TabBar(
        controller: _tabController,
        tabs: [
          Tab(text: 'Allerte'),
          Tab(text: 'News'),
        ],
      );

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      vsync: this,
      length: 2,
    );
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final _tabIndex =
          Provider.of<TabControllerProvider>(context, listen: false);
      _tabController.animateTo(_tabIndex.currentIndex);
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: _tabBar.preferredSize,
          child: Material(
            color: CustomColor.primaryColor, //<-- SEE HERE
            child: _tabBar,
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [listOfAlerts(), listOfNews()],
        ));
  }

  Widget listOfAlerts() {
    return ListView.builder(
      itemCount: 20,
      itemBuilder: (context, index) {
        if (index == 0) {
          return Container(
            padding: EdgeInsets.all(10),
            height: 80,
            color: CustomColor.primaryColor,
            child: Padding(
              padding: EdgeInsets.all(0),
              child: TextField(
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.search,
                      color: CustomColor.primaryColor,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    )),
              ),
            ),
          );
        } else {
          return Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 191, 187, 187).withOpacity(0.3),
                    spreadRadius: 3,
                    blurRadius: 5,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20))),
            height: 100,
            child: Row(children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomLeft: Radius.circular(20)),
                child: Image.network(
                  "https://cdn.pixabay.com/photo/2016/11/29/05/02/ashes-1867440_1280.jpg",
                  height: 150.0,
                  width: 100.0,
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                  width: 240,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 70,
                        child: Padding(
                          child: Center(
                              child: Text(
                            'Pericolo',
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          )),
                          padding: EdgeInsets.only(left: 4, right: 4),
                        ),
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                      ),
                      Text(
                        'Attentato all\'aeroporto di beirut',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '18 Ago 2022 - 18.10',
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      )
                    ],
                  ))
            ]),
          );
        }
      },
    );
  }

  Widget listOfNews() {
    return ListView.builder(
      itemCount: 20,
      itemBuilder: (context, index) {
        if (index == 0) {
          return Container(
            padding: EdgeInsets.all(10),
            height: 80,
            color: CustomColor.primaryColor,
            child: Padding(
              padding: EdgeInsets.all(0),
              child: TextField(
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.search,
                      color: CustomColor.primaryColor,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    )),
              ),
            ),
          );
        } else {
          return Container(
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(255, 191, 187, 187).withOpacity(0.3),
                  spreadRadius: 3,
                  blurRadius: 5,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(20))),
          height: 120,
          padding: EdgeInsets.all(10),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Container(
                width: 270,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Libia',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: CustomColor.primaryColor),
                    ),
                    Text(
                      'Oim, 193 migranti riportati a terra in 7 giorni',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '18 Ago 2022 - 18.10',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ],
                )),
            Icon(CupertinoIcons.chevron_right)
          ]),
        );
      }
      }
    );
  }
}
