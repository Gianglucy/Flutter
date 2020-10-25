import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class formatDay extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _formatDayState();
  }
}

class _formatDayState extends State<formatDay> {

  DateTime now = new DateTime.now();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "hahah",
      home: Scaffold(
        body: Center(
          child: Text(
               DateFormat("dd-mm-yyyy").format(now) ,
          style: TextStyle(fontSize: 25),
          ),
        ),
      ),
    );
  }
}