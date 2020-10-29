import 'package:DemoUI/modal/itemComment.dart';
import 'package:DemoUI/resources/colors.dart';
import 'package:DemoUI/resources/styles.dart';
import 'package:flutter/material.dart';
import 'package:DemoUI/screen/evaluation/evaluation.dart';

class CommentsPage extends StatefulWidget {
  CommentsPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _CommentPageState();
  }
}

class _CommentPageState extends State<CommentsPage> {
  List<ItemCommentModel> comments = [
    ItemCommentModel(
        avatar: Icons.tag_faces,
        name: "田中 太郎",
        content:
            "コメントコメントコメントコメントコメントコメントコメントコメントコメントコメントコメントコメントコメントコメントコメントコメントコメントコメント",
        time: "2020年10月9日"),
    ItemCommentModel(
        avatar: Icons.tag_faces,
        name: "田中 太郎",
        content:
        "コメントコメントコメントコメントコメントコメントコメントコメントコメントコメントコメントコメントコメントコメントコメントコメントコメントコメント",
        time: "2020年10月9日"),
    ItemCommentModel(
        avatar: Icons.tag_faces,
        name: "田中 太郎",
        content:
        "コメントコメントコメントコメントコメントコメントコメントコメントコメントコメントコメントコメントコメントコメントコメントコメントコメントコメントコメントコメントコメントコメントコメントコメントコメントコメントコメントコメントコメントコメントコメントコメントコメントコメントコメントコメントコメントコメントコメントコメントコメントコメントコメントコメントコメントコメントコメントコメントコメントコメントコメントコメントコメントコメントコメントコメントコメントコメントコメントコメントコメントコメントコメントコメントコメントコメントコメントコメントコメントコメントコメントコメント",
        time: "2020年10月9日"),
    ItemCommentModel(
        avatar: Icons.tag_faces,
        name: "田中 太郎",
        content:
        "コメントコメントコメントコメントコメントコメントコメントコメントコメントコメントコメントコメントコメントコメントコメントコメントコメントコメント",
        time: "2020年10月9日"),
    ItemCommentModel(
        avatar: Icons.tag_faces,
        name: "田中 太郎",
        content:
        "コメントコメントコメントコメントコメントコメントコメントコメントコメントコメントコメントコメントコメントコメントコメントコメントコメントコメント",
        time: "2020年10月9日"),
    ItemCommentModel(
        avatar: Icons.tag_faces,
        name: "田中 太郎",
        content:
        "コメントコメントコメントコメントコメントコメントコメントコメントコメントコメントコメントコメントコメントコメントコメントコメントコメントコメント",
        time: "2020年10月9日")
  ];

  @override
  Widget build(BuildContext context) {
    Size _screenSize = MediaQuery.of(context).size;
    // TODO: implement build
    return Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
            title: Text(widget.title),
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
              ),
            ]),
        body:
//        _itemComment()
            SafeArea(
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, i) {
                    return _itemComment(i);
                  },
                  itemCount: comments.length,
                ),
              ),
              GestureDetector(
                onTap: () {
                  onGoToEvaluation();
                },
                child: Container(
                    alignment: Alignment.center,
                    height: _screenSize.height * 0.07,
                    color: AppColors.mainColor,
                    child: Text(
                      "＋ 田中太郎さんを評価する",
                      textAlign: TextAlign.center,
                      style: AppStyles.whiteBold(18),
                    )),
              )
            ],
          ),
        ));
  }

  Widget _spaceWidthBox(double space) {
    return SizedBox(width: space);
  }

  Widget _spaceHeightBox(double space) {
    return SizedBox(height: space);
  }

  Widget _itemComment(int index) {
    return Container(
      color: AppColors.white,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                comments[index].avatar,
                color: AppColors.mainColor,
              ),
              _spaceWidthBox(4),
              Text(
                comments[index].name,
                style: AppStyles.blackBold(17),
              )
            ],
          ),
          _spaceHeightBox(8),
          Text(
            comments[index].content,
            style: AppStyles.greyText(14),
          ),
          _spaceHeightBox(8),
          Text(
            comments[index].time,
            style: AppStyles.blackText(10),
            textAlign: TextAlign.left,
          )
        ],
      ),
    );
  }

  onGoToEvaluation() {
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
}
