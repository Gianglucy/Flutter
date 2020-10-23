import 'dart:ffi';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'Extend/ExtendColor.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
      home: MyHomePage(title: 'プロフィール'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  Widget _userInfoWidget() {
    Size _screenSize = MediaQuery.of(context).size;
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Padding(padding: EdgeInsets.only(left: 48)),
        Flexible(
          flex: 1,
          fit: FlexFit.tight,
          child: ClipRRect(
            borderRadius:
                BorderRadius.all(Radius.circular(_screenSize.width * 0.2)),
            child: Image.asset(
              "assets/corgi.jpg",
              fit: BoxFit.cover,
            ),
          ),
        ),
        Padding(padding: EdgeInsets.only(left: 16)),
        Flexible(
          flex: 3,
          fit: FlexFit.tight,
          child: Container(
              width: _screenSize.width * 0.6,
              height: _screenSize.height * 0.13,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "田中 太郎",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        fontFamily: "Hiragino Sans"),
                  ),
                  Text(
                    "CEO / 株式会社aaa",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        fontFamily: "Hiragino Sans"),
                  ),
                  RichText(
                    text: TextSpan(children: [
                      WidgetSpan(
                        child: Icon(
                          Icons.location_on,
                          size: 14,
                        ),
                      ),
                      TextSpan(
                          text: "渋谷・東京都",
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              fontFamily: "Hiragino Sans"))
                    ]),
                  )
                ],
              )),
        ),
      ],
    );
  }

  Widget _options() {
    Size _screenSize = MediaQuery.of(context).size;
    const double sizeIcon = 35;
    const double sizeFont = 13;
    return Container(
      decoration: BoxDecoration(
        border: Border(
            top: BorderSide(width: 1, color: Colors.grey),
            bottom: BorderSide(width: 3, color: Colors.grey)),
      ),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.star_border,
                      color: HexColor("#fab91d"), size: sizeIcon),
                  onPressed: () {
                    print("====STAR====");
                  },
                ),
                Text(
                  "109人が好印象",
                  style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: sizeFont,
                      fontFamily: "Hiragino Sans"),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.tag_faces,
                      color: HexColor("#fab91d"),
                      size: sizeIcon,
                    ),
                    onPressed: () {
                      print("====SMILE====");
                    },
                  ),
                  Text(
                    "109人が好印象",
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: sizeFont,
                        fontFamily: "Hiragino Sans"),
                  )
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.messenger_outline,
                    color: HexColor("#fab91d"),
                    size: sizeIcon,
                  ),
                  onPressed: () {
                    print("====MESSAGE====");
                  },
                ),
                Text(
                  "コメント(15)",
                  style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: sizeFont,
                      fontFamily: "Hiragino Sans"),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _description() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 48, right: 48, top: 8, bottom: 16),
        child: Text(
          'プログラマーです。\nと共に日々事業を拡大し社員と楽しく仕事をしております。元々はサーバーサイドのエンジニアとして株式会社bbbで…',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
              color: Colors.grey,
              fontFamily: "Hiragino Sans"),
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }

  Widget _skills() {
    Color colorPrimary = HexColor("#fab91d");
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        decoration: BoxDecoration(
            border: Border.symmetric(
                horizontal: BorderSide(width: 1, color: Colors.grey))),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("興味・関心",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.black,
                      fontFamily: "Hiragino Sans")),
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Row(
                  children: [
                    Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: colorPrimary, width: 2),
                            borderRadius:
                                BorderRadius.all(Radius.circular(13))),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Text("ベンチャー",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  color: colorPrimary,
                                  fontFamily: "Hiragino Sans")),
                        )),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: colorPrimary, width: 2),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(13))),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Text("経営",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    color: colorPrimary,
                                    fontFamily: "Hiragino Sans")),
                          )),
                    ),
                    Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: colorPrimary, width: 2),
                            borderRadius:
                                BorderRadius.all(Radius.circular(13))),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Text("営業",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  color: colorPrimary,
                                  fontFamily: "Hiragino Sans")),
                        ))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _experience() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(width: 1, color: Colors.grey))),
        alignment: AlignmentDirectional.topStart,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("その他の職歴",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.black,
                      fontFamily: "Hiragino Sans")),
              Text('株式会社aaa / 経営者',
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      fontFamily: "Hiragino Sans")),
              Text('株式会社bbb / COO',
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      fontFamily: "Hiragino Sans")),
            ],
          ),
        ),
      ),
    );
  }

  Widget _educationalBackground() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(width: 1, color: Colors.grey))),
        alignment: AlignmentDirectional.topStart,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("学歴",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.black,
                      fontFamily: "Hiragino Sans")),
              Text('ccc大学 / 経済学部',
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      fontFamily: "Hiragino Sans")),
            ],
          ),
        ),
      ),
    );
  }

  Widget _purposeUse() {
    Color colorPrimary = HexColor("#fab91d");
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(width: 1, color: Colors.grey))),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("利用目的",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.black,
                      fontFamily: "Hiragino Sans")),
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Row(
                  children: [
                    Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: colorPrimary, width: 2),
                            borderRadius:
                                BorderRadius.all(Radius.circular(13))),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Text("営業",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  color: colorPrimary,
                                  fontFamily: "Hiragino Sans")),
                        )),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: colorPrimary, width: 2),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(13))),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Text("経営",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    color: colorPrimary,
                                    fontFamily: "Hiragino Sans")),
                          )),
                    ),
                    Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: colorPrimary, width: 2),
                            borderRadius:
                                BorderRadius.all(Radius.circular(13))),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Text("情報交換",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  color: colorPrimary,
                                  fontFamily: "Hiragino Sans")),
                        ))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(widget.title,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  fontFamily: "Hiragino Sans")),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
//            color: Color.fromRGBO(250, 185, 29, 1),
              color: HexColor("#fab91d"),
            ),
            onPressed: () {
              print("====BACK====");
            },
          ),
        ),
        body: Column(
          children: [
            _userInfoWidget(),
            _options(),
            _description(),
            _skills(),
            _experience(),
            _educationalBackground(),
            _purposeUse()
          ],
        ));
  }
}
