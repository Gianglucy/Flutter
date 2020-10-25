import 'package:flutter/painting.dart';
import 'extend/extendColor.dart';
import 'package:flutter/material.dart';
import 'profile.dart';

class MyHome extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          primaryColor: Colors.white,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          appBarTheme: AppBarTheme(elevation: 0)),
      home: ProfilePage(title: 'プロフィール'),
    );
  }
}


