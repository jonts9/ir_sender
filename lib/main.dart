import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const platform = const MethodChannel('samples.flutter.dev/battery');
  var carrierFrequency = 38400;

  var desligaTv = [1,1,32,32,64,32,32,32,32,32,32,32,32,32,32,32,32,32,32,63,32,32,64,32,32,4637];
  var velocidade1 = [9300,4650,700,550,650,600,650,600,650,600,650,1700,650,550,650,600,650,600,650,1650,650,1600,650,1550,700,1600,700,550,650,1650,650,1600,650,1600,650,550,650,1700,650,550,650,600,650,1650,650,550,650,600,650,600,650,1700,650,550,650,1650,650,1600,650,550,650,1700,650,1600,650,1600,650];
  var desliga = [9300,4650,650,650,650,600,700,550,700,550,700,1600,600,600,650,600,700,550,700,1600,650,1650,600,1650,600,1650,600,600,650,1650,650,1650,600,1650,600,600,650,1650,650,1650,600,1650,600,1650,600,600,650,600,700,550,700,1600,650,600,700,550,700,550,700,550,700,1600,650,1650,600,1650,600];

  Future<void> _getBatteryLevel(pattern) async {
    print("pattern: $pattern");
    try {
      final String result = await platform.invokeMethod('getBatteryLevel',{"carrierFrequency":carrierFrequency, "pattern":pattern});
      print(result);
    } on PlatformException catch (e) {
    }
  }

  _vel1(){
    _getBatteryLevel(velocidade1);
  }
  _desliga(){
    _getBatteryLevel(desliga);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            RaisedButton(
              child: Text('1'),
              onPressed: _vel1,
            ),
            RaisedButton(
              child: Text('Desliga'),
              onPressed: _desliga,
            ),
          ],
        ),
      ),
    );
  }
}
