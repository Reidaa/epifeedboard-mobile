import 'package:epiflipboard/UI/components/generic/WrapOverflowText.dart';
import 'package:epiflipboard/UI/utils.dart';
import 'file:///C:/Users/Moi/Documents/GitLab/epiflipboard/epiflipboard-app/lib/models/Article.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ArticleWidget extends StatelessWidget {
  final ArticleModel article;

  const ArticleWidget({Key key, @required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => buildWebViewArticle(context: context, article: article),
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 55,
            child: _buildCover(context: context, imageUrl: article.imageUrl),
          ),
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
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(imageUrl),
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
      @required String age,
      @required String authorName}) {
    var size = 14.0;

    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.only(top: 4.0),
        child: Text(
          "$url | $age | $authorName",
          style: TextStyle(fontSize: size),
        ),
      ),
    );
  }

  Widget _buildBody({@required String body}) {
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

List<Widget> buildArticlesWidgetList({@required List<ArticleModel> articles}) {
  var widgetList = <Widget>[];

  for (var i = 0; i < articles.length; i++) {
    widgetList.add(ArticleWidget(article: articles[i]));
  }

  return widgetList;
}
