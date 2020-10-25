import 'package:flutter/painting.dart';
import 'extend/extendColor.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  static _starHandle() {
    print("======STAR======");
  }

  static _smileHandle() {
    print("======SMILE======");
  }

  static _chatHandle() {
    print("======CHAT======");
  }

  Widget SpaceBox(double space) {
    return SizedBox(width: space);
  }

  Widget YellowBox(String name) {
    Color colorPrimary = HexColor("#fab91d");
    return Container(
        decoration: BoxDecoration(
            border: Border.all(color: colorPrimary, width: 2),
            borderRadius: BorderRadius.all(Radius.circular(13))),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(name,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: colorPrimary,
                  fontFamily: "Hiragino Sans")),
        ));
  }

  Widget _optionChild(String title, IconData icon, Function _doSomeThing) {
    const double sizeIcon = 35;
    const double sizeFont = 13;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        IconButton(
          icon: Icon(
            icon,
            color: HexColor("#fab91d"),
            size: sizeIcon,
          ),
          onPressed: () {
            _doSomeThing();
          },
        ),
        Text(
          title,
          style: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.bold,
              fontSize: sizeFont,
              fontFamily: "Hiragino Sans"),
        )
      ],
    );
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
            _optionChild("109人が好印象", Icons.star_border, _starHandle()),
            SpaceBox(16),
            _optionChild("109人が好印象", Icons.tag_faces, _smileHandle()),
            SpaceBox(16),
            _optionChild("コメント(15)", Icons.messenger_outline, _starHandle())
          ],
        ),
      ),
    );
  }

  Widget _description() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 16),
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
    );
  }

  Widget _skills() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 16),
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
                YellowBox("ベンチャー"),
                SpaceBox(8),
                YellowBox("経営"),
                SpaceBox(8),
                YellowBox("営業")
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _experience() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 16),
      alignment: AlignmentDirectional.topStart,
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
    );
  }

  Widget _educationalBackground() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 16),
      alignment: AlignmentDirectional.topStart,
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
    );
  }

  Widget _purposeUse() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 16),
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
                YellowBox("営業"),
                SpaceBox(8),
                YellowBox("経営"),
                SpaceBox(8),
                YellowBox("情報交換")
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _shortDivider() {
    return Divider(thickness: 1, color: Colors.grey, indent: 16, endIndent: 16);
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
            _shortDivider(),
            _skills(),
            _shortDivider(),
            _experience(),
            _shortDivider(),
            _educationalBackground(),
            _shortDivider(),
            _purposeUse(),
            _shortDivider()
          ],
        ));
  }
}
