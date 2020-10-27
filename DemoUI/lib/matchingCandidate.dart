import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'extend/extendColor.dart';
import 'package:flutter_tags/flutter_tags.dart';

class MatchingCandidatePage extends StatefulWidget {
  MatchingCandidatePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MatchingCandidatePageState();
  }
}

class _MatchingCandidatePageState extends State<MatchingCandidatePage> {
  Widget _spaceWidthBox(double space) {
    return SizedBox(width: space);
  }

  Widget _spaceHeightBox(double space) {
    return SizedBox(height: space);
  }

  Widget _richTextCustome(
      IconData icon, double iconSize, String text, double fontSize) {
    return RichText(
      text: TextSpan(children: [
        WidgetSpan(
          child: Icon(
            icon,
            size: iconSize,
          ),
        ),
        TextSpan(
            text: text,
            style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.bold,
                fontSize: fontSize,
                fontFamily: "Hiragino Sans"))
      ]),
    );
  }

  Widget _page() {
    return Container(
      decoration: BoxDecoration(
          border: Border(
              top: BorderSide(width: 1, color: Colors.grey),
              bottom: BorderSide(width: 1, color: Colors.grey))),
      padding: const EdgeInsets.symmetric(vertical: 4),
      alignment: Alignment.center,
      child: Text(
        "10/10",
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 13,
            fontFamily: "Hiragino Sans"),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _yellowBox(String name) {
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

  Widget _userInfoWidget() {
    Size _screenSize = MediaQuery.of(context).size;
    return Stack(children: [
      Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(width: 1, color: Colors.grey))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Flexible(
                  flex: 3,
//                  fit: FlexFit.tight,
                  child: Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(_screenSize.height),
                      child: Image(
                        height: _screenSize.width * 0.25,
                        width: _screenSize.width * 0.25,
//                          fit: BoxFit.cover,
                        image: AssetImage(
                          "assets/corgi.jpg",
                        ),
                      ),
                    ),
                  ),
                ),
                _spaceWidthBox(16),
                Flexible(
                  flex: 7,
                  fit: FlexFit.tight,
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
                        "経営者 / CEO / 株式会社aaa",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            fontFamily: "Hiragino Sans"),
                      ),
                      _richTextCustome(Icons.location_on, 14, "渋谷・東京都", 12),
                      _spaceHeightBox(8),
                      _richTextCustome(Icons.tag_faces, 19, "109人が好印象", 14)
                    ],
                  ),
                ),
              ],
            ),
            _spaceHeightBox(16),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "プログラマーです。\n 私は現在株式会社aaaで代表取締役社長CEOとして社員130人と共に日々事業を拡大し社員と楽しく仕事をしております。元々はサーバーサイドのエンジニアとして株式会社bbbで...",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    fontFamily: "Hiragino Sans",
                    color: Colors.grey),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        ),
      ),
      Positioned(
          right: -8,
          top: -5,
          child: IconButton(
            icon: Icon(
              Icons.vertical_align_bottom_outlined,
              color: Colors.grey,
            ),
            onPressed: () {
              print("====SETTING====");
            },
          )),
    ]);
  }

  Widget _interesting() {
    List _itemsInteresting = <String>["ベンチャー", "経営", "営業"];
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(width: 1, color: Colors.grey))),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
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
            child: Tags(
              itemCount: _itemsInteresting.length,
              itemBuilder: (int index) {
                final item = _itemsInteresting[index];
                return ItemTags(
                  index: index,
                  title: item.toString(),
                  textStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: HexColor("#fab91d"),
                      fontFamily: "Hiragino Sans"),
                  textActiveColor: HexColor("#fab91d"),
                  textColor: HexColor("#fab91d"),
                  elevation: 0,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                  borderRadius: BorderRadius.all(Radius.circular(14)),
                  border: Border.all(color: HexColor("#fab91d"), width: 2),
                  activeColor: Colors.white,
                  active: false,
                  alignment: MainAxisAlignment.start,
                );
              },
            ),
          )
        ],
      ),
    );
  }

  Widget _skill() {
    List _itemsSkill = <String>[
      "ベンチャー",
      "経営",
      "経営",
      "営業",
      "経営",
      "経営",
      "経営",
      "経営"
    ];
    return Expanded(
      flex: 1,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("スキル",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.black,
                    fontFamily: "Hiragino Sans")),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Tags(
                itemCount: _itemsSkill.length,
                itemBuilder: (int index) {
                  final item = _itemsSkill[index];
                  return ItemTags(
                    index: index,
                    title: item.toString(),
                    textStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: HexColor("#fab91d"),
                        fontFamily: "Hiragino Sans"),
                    textActiveColor: HexColor("#fab91d"),
                    textColor: HexColor("#fab91d"),
                    elevation: 0,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                    borderRadius: BorderRadius.all(Radius.circular(14)),
                    border: Border.all(color: HexColor("#fab91d"), width: 2),
                    activeColor: Colors.white,
                    active: false,
                    alignment: MainAxisAlignment.start,
                  );
                },
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.bottomCenter,
                child: Text("プロフィール詳細を見る",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: HexColor("#fab91d"),
                        fontFamily: "Hiragino Sans")),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _twoButtons() {
    return Row(
      children: [
        Flexible(
          flex: 1,
          fit: FlexFit.tight,
          child: GestureDetector(
            onTap: () {
              print("abc");
            },
            child: Container(
              decoration: BoxDecoration(
                  border: Border(
                      top: BorderSide(width: 1, color: Colors.grey),
                      right: BorderSide(width: 1, color: Colors.grey),
                      bottom: BorderSide(width: 1, color: Colors.grey))),
              alignment: Alignment.center,
              height: 44,
              child: Text("興味なし",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                      color: Colors.black,
                      fontFamily: "Hiragino Sans")),
            ),
          ),
        ),
        Flexible(
          flex: 1,
          fit: FlexFit.tight,
          child: GestureDetector(
            onTap: () {
              print("abc");
            },
            child: Container(
              decoration: BoxDecoration(
                  border: Border(
                      top: BorderSide(width: 1, color: Colors.grey),
                      bottom: BorderSide(width: 1, color: Colors.grey))),
              alignment: Alignment.center,
              height: 44,
              child: Text("興味あり",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                      color: Colors.black,
                      fontFamily: "Hiragino Sans")),
            ),
          ),
        )
      ],
    );
  }

  Widget _infoCandidate() {
    return Flexible(
        flex: 1,
        fit: FlexFit.tight,
        child: Container(
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 1),
            ),
            margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
//            color: Colors.yellow,
            child: Column(
              children: [
                _userInfoWidget(),
                _interesting(),
                _skill(),
                _twoButtons()
              ],
            ),
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    Size _screenSize = MediaQuery.of(context).size;
    // TODO: implement build
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(widget.title,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  fontFamily: "Hiragino Sans")),
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius:
                      BorderRadius.all(Radius.circular(_screenSize.width / 2)),
                  child: Image.asset("assets/corgi.jpg",
                      height: 50, width: 50, fit: BoxFit.fitWidth),
                ),
                Positioned(
                  // draw a red marble
                  top: -1,
                  right: -1,
                  child: new Icon(Icons.brightness_1,
                      size: 15, color: Colors.redAccent),
                )
              ],
            ),
          ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.settings,
                color: Colors.grey,
              ),
              onPressed: () {
                print("====SETTING====");
              },
            ),
          ],
        ),
        body: Column(
          children: [
            _page(),
            _infoCandidate(),
          ],
        ));
  }
}
