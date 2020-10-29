import 'package:DemoUI/resources/colors.dart';
import 'package:DemoUI/resources/images.dart';
import 'package:DemoUI/resources/styles.dart';
import 'package:flutter/painting.dart';
import '../../extend/extendColor.dart';
import 'package:flutter/material.dart';
import '../comments/comments.dart';
import '../evaluation/evaluation.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key key, this.title, this.isModal}) : super(key: key);

  final String title;
  bool isModal = false;

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: widget.isModal
            ? null
            : AppBar(
                title: Text(widget.title, style: AppStyles.blackBold(20)),
                leading: IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: AppColors.mainColor,
                  ),
                  onPressed: () {
                    print("====BACK====");
                  },
                ),
              ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              _buttonCloseModal(),
              widget.isModal ? _spaceHeightBox(0) : _spaceHeightBox(16),
              _userInfoWidget(),
              _spaceHeightBox(16),
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
//              _count()
            ],
          ),
        ));
  }

  _starHandle() {
    print("======STAR======");
  }

  _smileHandle() {
    print("======SMILE======");
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
              height: MediaQuery.of(context).size.height * 0.8,
              child: EvaluationPage(
                title: "評価",
              ));
        },
        isScrollControlled: true);
  }

  void _commentHandle() {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
              height: MediaQuery.of(context).size.height * 0.8,
              child: CommentsPage(
                title: "評価とコメント",
              ));
        },
        isScrollControlled: true);
  }

  Widget _spaceWidthBox(double space) {
    return SizedBox(width: space);
  }

  Widget _spaceHeightBox(double space) {
    return SizedBox(height: space);
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

  Widget _optionChild(String title, IconData icon, VoidCallback doSomeThing) {
    const double sizeIcon = 35;
    const double sizeFont = 13;
    return GestureDetector(
      onTap: doSomeThing,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(
            icon,
            color: AppColors.mainColor,
            size: sizeIcon,
          ),
          Text(
            title,
            style: AppStyles.greyBold(sizeFont),
          )
        ],
      ),
    );
  }

  Widget _buttonCloseModal() {
    return Container(
      height: widget.isModal ? MediaQuery.of(context).size.height * 0.035 : 0,
      child: Stack(children: [
        Positioned(
          top: 0,
          right: 0,
          child: IconButton(
            onPressed: onCloseModal,
            icon: Icon(
              Icons.close,
            ),
          ),
        ),
      ]),
    );
  }

  Widget _userInfoWidget() {
    Size _screenSize = MediaQuery.of(context).size;
    return Stack(
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            _spaceWidthBox(32),
            Flexible(
              flex: 3,
              fit: FlexFit.tight,
              child: ClipRRect(
                borderRadius:
                    BorderRadius.all(Radius.circular(_screenSize.width / 4)),
                child: Center(
                  child: Image(image: AssetImage(AppImages.corgi)),
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
                    "CEO / 株式会社aaa",
                    style: AppStyles.blackBold(12),
                  ),
                  RichText(
                    text: TextSpan(children: [
                      WidgetSpan(
                        child: Icon(
                          Icons.location_on,
                          size: 14,
                        ),
                      ),
                      TextSpan(text: "渋谷・東京都", style: AppStyles.greyBold(12))
                    ]),
                  )
                ],
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget _options() {
    return Container(
      padding: const EdgeInsets.only(bottom: 10, top: 10),
      decoration: BoxDecoration(
        border: Border(
            top: BorderSide(width: 1, color: Colors.grey),
            bottom: BorderSide(width: 3, color: Colors.grey)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _optionChild("109人が好印象", Icons.tag_faces, () {
            _smileHandle();
          }),
          _spaceWidthBox(16),
          _optionChild("コメント(15)", Icons.messenger_outline, () {
            _commentHandle();
          })
        ],
      ),
    );
  }

  Widget _description() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        children: [
          _spaceHeightBox(16),
          Text(
            'プログラマーです。\nと共に日々事業を拡大し社員と楽しく仕事をしております。元々はサーバーサイドのエンジニアとして株式会社bbbで…',
            style: AppStyles.greyBold(15),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
          Container(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text('プロフィール詳細を見る', style: AppStyles.primaryBold(15)))
        ],
      ),
    );
  }

  Widget _skills() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("興味・関心", style: AppStyles.blackBold(18)),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Row(
              children: [
                _yellowBox("ベンチャー"),
                _spaceWidthBox(8),
                _yellowBox("経営"),
                _spaceWidthBox(8),
                _yellowBox("営業")
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
          Text("その他の職歴", style: AppStyles.blackBold(18)),
          Text('株式会社aaa / 経営者', style: AppStyles.blackText(14)),
          Text('株式会社bbb / COO', style: AppStyles.blackText(14)),
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
          Text("学歴", style: AppStyles.blackBold(18)),
          Text('ccc大学 / 経済学部', style: AppStyles.blackText(14)),
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
          Text("利用目的", style: AppStyles.blackBold(18)),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Row(
              children: [
                _yellowBox("営業"),
                _spaceWidthBox(8),
                _yellowBox("経営"),
                _spaceWidthBox(8),
                _yellowBox("情報交換")
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

  Widget _count() {
    Size _screenSize = MediaQuery.of(context).size;
    return Column(
      children: [
        Text(
          "2020年の\nあなたのマッチング数",
          style: AppStyles.blackBold(16),
          textAlign: TextAlign.center,
        ),
        _spaceHeightBox(32),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: _screenSize.width * 0.4,
              height: _screenSize.width * 0.4,
              decoration: BoxDecoration(
                  border: Border.all(color: AppColors.linesColor, width: 10),
                  borderRadius: BorderRadius.all(
                      Radius.circular((_screenSize.width * 0.4) / 2))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "24",
                    style: AppStyles.redAccentBold(40),
                  ),
                  Text(
                    "マッチング数",
                    style: AppStyles.redAccentText(10),
                  )
                ],
              ),
            ),
            Container(
              width: _screenSize.width * 0.4,
              height: _screenSize.width * 0.4,
              decoration: BoxDecoration(
                  border: Border.all(color: AppColors.linesColor, width: 10),
                  borderRadius: BorderRadius.all(
                      Radius.circular((_screenSize.width * 0.4) / 2))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "116",
                    style: AppStyles.cyantBold(40),
                  ),
                  Text(
                    "興味あり数",
                    style: AppStyles.cyantText(10),
                  )
                ],
              ),
            ),
          ],
        )
      ],
    );
  }

  onCloseModal() {
    print("dsdsd");
    Navigator.of(context).pop();
  }
}
