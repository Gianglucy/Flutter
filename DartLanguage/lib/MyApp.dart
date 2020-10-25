import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  String name;
  MyApp({this.name});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    print("this is createState");
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  String _name = "";
  final nameController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    print("this is initState");
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
    print("this is dispose");
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // TODO: implement didChangeAppLifecycleState
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.paused) {
      print("go to BackGround");
    }
    if (state == AppLifecycleState.resumed) {
      print("go to foreGround");
    }
  }

  void onChangeText(String text) {
    this.setState(() {
      _name = text;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    print("this is build");
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Title",
      home: Scaffold(
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                child: TextField(
                    controller: nameController,
//                  onChanged: (text){this.setState(() {
//                    _name = text;
//                  });},
                    onChanged: (text) => { onChangeText(text)},
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                                const Radius.circular(8))),
                        labelText: "Fill name"))),
            Text(
              "My name: ",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            Text("$_name",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center)
          ],
        )),
      ),
    );
  }
}
