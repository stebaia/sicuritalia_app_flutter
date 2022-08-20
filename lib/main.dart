import 'package:flutter/material.dart';
import 'package:sicuritalia_app_flutter/ui/screens/scaffold_app.dart';
import 'package:sicuritalia_app_flutter/utils/theme/custom_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          fontFamily: 'Poppins',
          useMaterial3: true,
          backgroundColor: CustomColor.backgroundLightColor,
          primaryColor: CustomColor.primaryColor),
      home: const ScaffoldApp(),
    );
  }
}
