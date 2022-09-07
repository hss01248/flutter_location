import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_location/flutter_location.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';
  final _flutterLocationPlugin = FlutterLocation();

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      platformVersion =
          await _flutterLocationPlugin.getPlatformVersion() ?? 'Unknown getLocation';
    } on PlatformException {
      platformVersion = 'Failed to  getLocation.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            children:<Widget>[
              Text('Running on: $_platformVersion\n'),
              MaterialButton(
                  height: 40,
                  elevation: 5,
                  color: Colors.orangeAccent,
                  textColor: Colors.white,
                  splashColor: Colors.blue,
                  padding: EdgeInsets.all(8),
                  child: Text("点击定位"),
                  onPressed: () => requestLocation()),
                  //Navigator.of(context).pushNamed('AboutMePage'))
            ]

          )
        ),
      ),
    );
  }

  requestLocation() async{
    String platformVersion;
    try {
      platformVersion =
          await _flutterLocationPlugin.getLocation() ?? 'Unknown getLocation';
    } on PlatformException {
      platformVersion = 'Failed to  getLocation.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }


}
