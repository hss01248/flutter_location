import 'package:flutter/material.dart';
class DebugBtn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        height: 40,
        elevation: 5,
        color: Colors.orangeAccent,
        textColor: Colors.white,
        splashColor: Colors.blue,
        padding: EdgeInsets.all(8),
        child: Text("MaterialButton"),
        onPressed: () =>  Navigator.of(context).pushNamed('AboutMePage'));
  }
}