import 'package:flutter/painting.dart';
import 'extend/extendColor.dart';
import 'package:flutter/material.dart';
import 'profile.dart';
import 'matchingCandidate.dart';

class MyHome extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
//    return MaterialApp(
//      debugShowCheckedModeBanner: false,
//      title: 'Flutter Demo',
//      theme: ThemeData(
//          primaryColor: Colors.white,
//          visualDensity: VisualDensity.adaptivePlatformDensity,
//          appBarTheme: AppBarTheme(elevation: 0)),
//      home: ProfilePage(title: 'プロフィール'),
//    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          primaryColor: Colors.white,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          appBarTheme: AppBarTheme(elevation: 0)),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    MatchingCandidatePage(title: 'マッチング候補'),
    PlaceholderWidget(Colors.deepOrange)
  ];

  void onTabTapped(int index) {
    this.setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    const double sizeLable = 10;
    const double sizeIcon = 40;
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: _currentIndex,
        selectedItemColor: HexColor("#fab91d"),
        unselectedFontSize: sizeLable,
        selectedFontSize: sizeLable,
        onTap: onTabTapped,
        // this will be set when a new tab is tapped
        items: [
          BottomNavigationBarItem(
            icon: Stack(children: [
              new Icon(Icons.person_add_alt_1_sharp, size: 45),
              Positioned(
                // draw a red marble
                top: -2,
                right: -2,
                child: new Icon(Icons.brightness_1,
                    size: 22, color: Colors.redAccent),
              ),
              Positioned(
                // draw a red marble
                top: 2,
                right: 1,
                child: new Text(
                  "10",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.bold),
                ),
              )
            ]),
            label: 'マッチング候補',
          ),
          BottomNavigationBarItem(
            icon: Stack(children: [
              new Icon(Icons.messenger_sharp, size: sizeIcon),
              Positioned(
                // draw a red marble
                top: -2,
                right: -2,
                child: new Icon(Icons.brightness_1,
                    size: 22, color: Colors.redAccent),
              ),
              Positioned(
                // draw a red marble
                top: 2,
                right: 4,
                child: new Text(
                  "4",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.bold),
                ),
              )
            ]),
            label: 'チャット',
          )
        ],
      ),
    );
  }
}

class PlaceholderWidget extends StatelessWidget {
  final Color color;

  PlaceholderWidget(this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
    );
  }
}
