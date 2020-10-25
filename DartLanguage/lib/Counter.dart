import 'package:flutter/material.dart';

class Counter extends StatefulWidget {

  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int _counter = 0;

  void _increment() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Text('Count: $_counter'),
      ],
    );
  }
}

//class MyButton extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    // The GestureDetector wraps the button.
//    return GestureDetector(
//      // When the child is tapped, show a snackbar.
//      onTap: () {
//        final snackBar = SnackBar(content: Text("Tap"));
//        print("ddd");
////         Scaffold.of(context).showSnackBar(snackBar);
//      },
//      // The custom button
//      child: Container(
//        padding: EdgeInsets.all(12.0),
//        decoration: BoxDecoration(
//          color: Theme.of(context).buttonColor,
//          borderRadius: BorderRadius.circular(8.0),
//        ),
//        child: Text('My Button'),
//      ),
//    );
//  }
//}
