import 'package:epiflipboard/UI/views/ArticleWebview.dart';
import 'package:epiflipboard/data/ArticleModel.dart';
import 'package:flutter/material.dart';

buildWebViewArticle(
    {@required BuildContext context, @required ArticleData article}) {
  return Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => ArticleWebview(article: article),
    ),
  );
}
