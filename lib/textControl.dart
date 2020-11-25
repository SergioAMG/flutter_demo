import 'package:flutter/material.dart';

class TextControl extends StatelessWidget {
  final Function updateText;
  final Function resetText;
  final int counterOfChanges;

  TextControl({this.updateText, this.resetText, this.counterOfChanges});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
          child: Text('Press button to change text displayed'),
        ),
        Container(
          width: double.infinity,
          child: RaisedButton(
            onPressed: updateText,
            child: Text('Change Text'),
            color: Colors.orange,
            textColor: Colors.white,
          ),
        ),
        if (counterOfChanges > 1)
          Container(
            width: double.infinity,
            child: RaisedButton(
              onPressed: resetText,
              child: Text('Reset Text'),
              color: Colors.deepOrange,
              textColor: Colors.white,
            ),
          ),
      ],
    );
  }
}
