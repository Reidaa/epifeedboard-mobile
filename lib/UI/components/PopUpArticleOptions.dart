import 'file:///C:/Users/Moi/Documents/GitLab/epiflipboard/epiflipboard-app/lib/models/Article.dart';
import 'package:flutter/material.dart';

enum Options {
  harder,
  smarter,
  selfStarter,
  tradingCharter,
}

class PopUpArticleOptions extends StatefulWidget {
  final ArticleModel article;

  const PopUpArticleOptions({Key key, @required this.article})
      : super(key: key);

  @override
  _PopUpArticleOptionsState createState() => _PopUpArticleOptionsState();
}

class _PopUpArticleOptionsState extends State<PopUpArticleOptions> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
