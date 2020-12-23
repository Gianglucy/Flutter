import 'package:DemoUI/resources/colors.dart';
import 'package:DemoUI/resources/images.dart';
import 'package:DemoUI/resources/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_tags/flutter_tags.dart';
import 'package:readmore/readmore.dart';
import '../profile/profile.dart';
import 'dart:math';

class MatchingCandidatePage extends StatefulWidget {
  MatchingCandidatePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MatchingCandidatePageState();
  }
}

class _MatchingCandidatePageState extends State<MatchingCandidatePage>
    with TickerProviderStateMixin {
  AnimationController _rotationController;
  Animation<double> _animation;
  AnimationController _controllerText;
  Animation<double> _animationText;

  @override
  void initState() {
    super.initState();
    _rotationController =
        AnimationController(vsync: this, duration: Duration(seconds: 2));

    _animation = Tween(begin: 0.0, end: 0.25).animate(_rotationController);

    _controllerText = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );
    _animationText = CurvedAnimation(
      parent: _controllerText,
      curve: Curves.fastOutSlowIn,
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _rotationController.dispose();
    _controllerText.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size _screenSize = MediaQuery.of(context).size;
    // TODO: implement build
    // String data =
    //     "dsdasdasdasdsaddsadsadsadsadsadasdasds";
    String data =
        "dsdasdasdasdsaddsadsadsadsadsadasdasds dsdasdasdasdsaddsadsadsadsadsadasdasds dsdasdasdasdsaddsadsadsadsadsadasdasds dsdasdasdasdsaddsadsadsadsadsadasdasds dsdasdasdasdsaddsadsadsadsadsadasdasds dsdasdasdasdsaddsadsadsadsadsadasdasds";
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(widget.title, style: AppStyles.blackBold(20)),
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius:
                      BorderRadius.all(Radius.circular(_screenSize.width / 2)),
                  child: Image.asset(AppImages.corgi,
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
                _rotationController.forward();
                _controllerText.forward();
              },
            ),
          ],
        ),
        body: Container(
            child: ReadMoreText(
          data,
          trimLines: 2,
          trimMode: TrimMode.Line,
          action: handle,
          trimCollapsedText: 'Show more',
          trimExpandedText: 'Show less',
        ))
//        Column(
//          children: [
//            _page(),
//            _infoCandidate(),
//          ],
//        )
//            Container(
//                child: InkWell(
//          onTap: action,
//          child: Container(
//            padding: const EdgeInsets.all(16),
//            child: Row(
//              mainAxisAlignment: MainAxisAlignment.spaceBetween,
//              children: [
//                Expanded(child: Text("ABC")),
//                RotatedBox(
//                  quarterTurns: 0,
//                  child: Icon(Icons.arrow_forward_ios_rounded,
//                      color: Colors.red, size: 20),
//                )
//              ],
//            ),
//          ),
//        ))
        );
  }

  handle() {
    print("sdsadasd");
  }

  action() {
    print("afsd");
  }

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
        TextSpan(text: text, style: AppStyles.greyBold(fontSize))
      ]),
    );
  }

  Widget _tagCustom(List<String> items) {
    return Tags(
      itemCount: items.length,
      itemBuilder: (int index) {
        final item = items[index];
        return ItemTags(
          index: index,
          title: item.toString(),
          textStyle: AppStyles.primaryBold(14),
          textActiveColor: AppColors.mainColor,
          textColor: AppColors.mainColor,
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
          borderRadius: BorderRadius.all(Radius.circular(14)),
          border: Border.all(color: AppColors.mainColor, width: 2),
          activeColor: AppColors.white,
          active: false,
          alignment: MainAxisAlignment.start,
        );
      },
    );
  }

  Widget _page() {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.white,
          boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 15.0)],
          border: Border(
            top: BorderSide(width: 1, color: Colors.grey),
//              bottom: BorderSide(width: 1, color: Colors.grey)
          )),
      padding: const EdgeInsets.symmetric(vertical: 4),
      alignment: Alignment.center,
      child: Text(
        "10/10",
        style: AppStyles.blackBold(13),
        textAlign: TextAlign.center,
      ),
    );
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
                          AppImages.corgi,
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
                        style: AppStyles.blackBold(20),
                      ),
                      Text(
                        "経営者 / CEO / 株式会社aaa",
                        style: AppStyles.blackBold(14),
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
                style: AppStyles.greyBold(14),
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
          Text("興味・関心", style: AppStyles.blackBold(18)),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: _tagCustom(_itemsInteresting),
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
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("スキル", style: AppStyles.blackBold(18)),
                  _spaceHeightBox(8),
                  _tagCustom(_itemsSkill),
                ],
              ),
            ),
            Container(
                alignment: Alignment.center,
                child: GestureDetector(
                    onTap: onGoToDetailCandidate,
                    child:
                        Text("プロフィール詳細を見る", style: AppStyles.primaryBold(18))))
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
              child: Text("興味なし", style: AppStyles.blackBold(13)),
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
              child: Text("興味あり", style: AppStyles.blackBold(13)),
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

  void onGoToDetailCandidate() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext contex) {
        return Container(
            height: MediaQuery.of(contex).size.height * 0.8,
            child: ProfilePage(title: "プロフィール", isModal: true));
      },
      isScrollControlled: true,
    );
  }
}
