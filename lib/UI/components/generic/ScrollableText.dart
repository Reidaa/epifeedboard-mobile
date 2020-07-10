import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScrollableText extends StatelessWidget {
  final String text;
  final TextStyle style;

  const ScrollableText({Key key, @required this.text, this.style})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical, //.horizontal
        child: Text(text, style: style),
      ),
    );
  }
}
