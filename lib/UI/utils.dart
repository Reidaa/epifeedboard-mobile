import 'package:epiflipboard/UI/views/ArticleWebview.dart';
import 'package:epiflipboard/models/models.dart';
import 'package:flutter/material.dart';

buildWebViewArticle(
    {@required BuildContext context, @required ArticleModel article}) {
  return Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => ArticleWebview(article: article),
    ),
  );
}
