import 'package:DemoUI/resources/styles.dart';
import 'package:flutter/material.dart';
import 'package:DemoUI/resources/images.dart';
import 'package:DemoUI/resources/colors.dart';

class EvaluationPage extends StatefulWidget {
  EvaluationPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _EvaluationPageState();
  }
}

class _EvaluationPageState extends State<EvaluationPage> {
//  states
  String optionSelected = "";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: Text(
          widget.title,
        ),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: Icon(
              Icons.close,
              color: Colors.grey,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            _userInfoWidget(),
            _spaceHeightBox(16),
            _lineCustom(width: 2, padding: 0),
            Expanded(child: _voting()),
            _lineCustom(width: 1, padding: 32),
            _spaceHeightBox(50),
            _buttonSelecting()
          ],
        ),
      ),
    );
  }

  Widget _spaceWidthBox(double space) {
    return SizedBox(width: space);
  }

  Widget _spaceHeightBox(double space) {
    return SizedBox(height: space);
  }

  Widget _lineCustom({double width, double padding}) {
    return Divider(
        thickness: width,
        color: Colors.grey,
        indent: padding,
        endIndent: padding);
  }

  Widget _userInfoWidget() {
    Size _screenSize = MediaQuery.of(context).size;
    return Row(
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
    );
  }

  Widget _voting() {
    return Column(
      children: [
        _spaceHeightBox(8),
        Text(
          "田中太郎さんの印象は？",
          style: AppStyles.blackBold(18),
        ),
        _spaceHeightBox(16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            _optionChild(
                title: "好印象",
                icon: AppImages.good,
                doSomeThing: () {
                  onGood();
                },
                color: AppColors.orangeColor,
                focusColor: optionSelected == "1"
                    ? AppColors.focusColor
                    : AppColors.white),
            _optionChild(
                title: "普通",
                icon: AppImages.normal,
                doSomeThing: () {
                  onNormal();
                },
                color: AppColors.greenColor,
                focusColor: optionSelected == "2"
                    ? AppColors.focusColor
                    : AppColors.white),
            _optionChild(
                title: "悪印象",
                icon: AppImages.bad,
                doSomeThing: () {
                  onBad();
                },
                color: AppColors.redColor,
                focusColor: optionSelected == "3"
                    ? AppColors.focusColor
                    : AppColors.white)
          ],
        ),
        _spaceHeightBox(16),
        Text(
          "コメントを入力してください",
          style: AppStyles.blackBold(18),
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: TextField(
              decoration:
                  InputDecoration(border: InputBorder.none, hintText: '普通'),
            ),
          ),
        )
      ],
    );
  }

  Widget _optionChild(
      {String title,
      String icon,
      VoidCallback doSomeThing,
      Color color,
      Color focusColor}) {
    Size _screenSize = MediaQuery.of(context).size;
    const double sizeFont = 13;
    return GestureDetector(
      onTap: doSomeThing,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 9, horizontal: 16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            color: focusColor),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image(
              image: AssetImage(icon),
              width: _screenSize.width * 0.15,
              height: _screenSize.width * 0.15,
            ),
            _spaceHeightBox(4),
            Text(
              title,
              style: AppStyles.greyBold(sizeFont).copyWith(color: color),
            )
          ],
        ),
      ),
    );
  }

  Widget _buttonSelecting() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          "キャンセル",
          style: AppStyles.blackText(17),
        ),
        _spaceWidthBox(16),
        Text(
          "登録する",
          style: AppStyles.primaryText(17),
        ),
        _spaceWidthBox(32),
      ],
    );
  }

  onGood() {
    print("===GOOD===");
    this.setState(() {
      optionSelected = "1";
    });
  }

  onNormal() {
    print("===NORMAL===");
    this.setState(() {
      optionSelected = "2";
    });
  }

  onBad() {
    print("===BAD===");
    this.setState(() {
      optionSelected = "3";
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
