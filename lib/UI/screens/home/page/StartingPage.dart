import './PrimaryArticleBox.dart';
import './SecondaryArticleBox.dart';
import 'package:epiflipboard/models/models.dart';
import 'package:flutter/material.dart';

class StartingPage extends StatelessWidget {
  final List<ArticleModel> articles;
  final double _pad = 10.0;

  const StartingPage({Key key, @required this.articles}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        AppBar(title: Text("Epiflipboard")),
        Expanded(
          child: Column(
            children: <Widget>[
              Expanded(
                  flex: 60, child: PrimaryArticleBox(article: articles[0])),
              Expanded(
                flex: 40,
                child: Padding(
                  padding: EdgeInsets.all(_pad),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(right: _pad / 2.0),
                          child: SecondaryArticleBox(article: articles[1]),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(left: _pad / 2.0),
                          child: SecondaryArticleBox(article: articles[2]),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
