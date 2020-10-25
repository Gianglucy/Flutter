import 'package:flutter/material.dart';

class SafeView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SafeViewState();
  }
}

class _SafeViewState extends State<SafeView> {
  _showInfo() {
    print("$_name $_age");
  }

  String _name = "";
  String _age = "";
  final _controlerName = TextEditingController();
  final _controlerAge = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "SafeView",
      home: Scaffold(
        body: SafeArea(
          child: Container(
            margin: EdgeInsets.fromLTRB(16, 0, 16, 0),
            child: Column(
              children: <Widget>[
                TextField(
                  controller: _controlerName,
                  decoration: InputDecoration(labelText: "Name"),
                  onChanged: (text) {
                    this.setState(() {
                      _name = text;
                    });
                  },
                ),
                TextField(
                  controller: _controlerAge,
                  decoration: InputDecoration(labelText: "Age"),
                  onChanged: (text) {
                    this.setState(() {
                      _age = text;
                    });
                  },
                ),
                FlatButton(
                  onPressed: _showInfo,
                  child: Text("Click Me!!!"),
                  color: Colors.green,
                  textColor: Colors.white,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
