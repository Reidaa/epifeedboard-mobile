import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WrapOverflowText extends StatelessWidget {
  final String text;
  final double size;
  final int maxLine;

  const WrapOverflowText({Key key, @required this.text, this.size = 18, this.maxLine})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
      double height = constraints.biggest.height;

      if (Platform.isAndroid) {
        height -= 30;
      }
      return Text(
        text,
        style: TextStyle(fontSize: size),
        overflow: TextOverflow.ellipsis,
        maxLines: (maxLine != null ? maxLine : ((height / size).floor() - 1)),
      );
    });
  }
}
