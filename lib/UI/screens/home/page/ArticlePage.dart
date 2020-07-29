import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:transparent_image/transparent_image.dart';

import 'package:epiflipboard/ui/shared/ArticleWebview.dart';
import 'package:epiflipboard/ui/shared/WrapOverflowText.dart';
import 'package:epiflipboard/models/models.dart';

class ArticlePage extends StatelessWidget {
  final ArticleModel article;

  const ArticlePage({Key key, @required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => pushWebViewArticle(context: context, article: article),
      child: Column(
        children: <Widget>[
          _buildCover(context: context, imageUrl: article.imageUrl),
          Expanded(
            flex: 45,
            child: Padding(
              padding: EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
              child: Column(
                children: <Widget>[
                  _buildTitle(title: article.title),
                  _buildHeader(
                      url: article.sourceUrl,
                      age: article.age,
                      authorName: article.authorName),
                  _buildBody(body: article.body),
                ],
              ),
            ),
          ),
          _buildInteraction(),
        ],
      ),
    );
  }

  Widget _buildCover(
      {@required BuildContext context, @required String imageUrl}) {
    if (imageUrl == null)
      return Container(height: 20);
    else
      return Expanded(
        flex: 55,
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: FadeInImage.memoryNetwork(
            fadeInDuration: const Duration(milliseconds: 250),
            placeholder: kTransparentImage,
            image: imageUrl,
            fit: BoxFit.cover,
          ),
        ),
      );
  }

  Widget _buildTitle({@required String title}) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        maxLines: 4,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
      ),
    );
  }

  Widget _buildHeader(
      {@required String url,
      @required DateTime age,
      @required String authorName}) {
    var size = 14.0;
    var ageString = "";

    if (age != null) {
      final DateFormat formatter = DateFormat("yyyy-MM-dd");
      ageString = formatter.format(age);
    }

    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.only(top: 4.0),
        child: Text(
          "$url | $ageString",
          style: TextStyle(fontSize: size),
        ),
      ),
    );
  }

  Widget _buildBody({@required String body}) {
    if (body == null) {
      return Container();
    }
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(top: 4.0),
        child: WrapOverflowText(
          text: body,
        ),
      ),
    );
  }

  Widget _buildInteraction() {
    return Container(
      height: 30,
      child: Placeholder(),
    );
  }
}

List<Widget> buildArticlesPageList({@required List<ArticleModel> articles}) {
  var widgetList = <Widget>[];

  for (var i = 0; i < articles.length; i++) {
    widgetList.add(ArticlePage(article: articles[i]));
  }

  return widgetList;
}
