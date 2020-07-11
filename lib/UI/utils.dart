import 'package:epiflipboard/UI/views/ArticleWebview.dart';
import 'file:///C:/Users/Moi/Documents/GitLab/epiflipboard/epiflipboard-app/lib/models/Article.dart';
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
