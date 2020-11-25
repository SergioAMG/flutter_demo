import 'package:flutter/material.dart';
import './textControl.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Assignment One',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Assignment One'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _textMessage = 'Welcome to Flutter Assignment';
  int _counterOfChanges = 1;

  void _updateText() {
    setState(() {
      _textMessage =
          "Text has been Changed " + _counterOfChanges.toString() + ' times.';
      print(
          'Text has been changed: ' + _counterOfChanges.toString() + ' times.');
      _counterOfChanges++;
    });
  }

  void _resetText() {
    setState(() {
      _textMessage = 'Welcome to Flutter Assignment';
      _counterOfChanges = 1;
      print('Text has been reset');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(0, 10, 0, 30),
              child: Text(
                _textMessage,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.orange),
              ),
            ),
            TextControl(
              updateText: _updateText,
              resetText: _resetText,
              counterOfChanges: _counterOfChanges,
            ),
          ],
        ),
      ),
    );
  }
}
