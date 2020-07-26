import 'package:epiflipboard/models/Article.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:epiflipboard/UI/components/ArticleWebview.dart';

class ArticleCard extends StatelessWidget {
  final compactSize = 200.0;
  final confortSize = 250.0;
  final ArticleModel article;

  const ArticleCard({Key key, @required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: GestureDetector(
        onTap: () => pushWebViewArticle(context: context, article: article),
        child: Column(
          children: <Widget>[
            _buildCover(context: context),
            _buildText(context: context),
          ],
        ),
      ),
    );
  }

  Widget _buildCover({@required BuildContext context}) {
    final String imageURL = article.imageUrl;

    if (imageURL != null) {
      return Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        // semanticContainer: true,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        child: Container(
          height: compactSize,
          width: MediaQuery.of(context).size.width,
          child: FadeInImage.memoryNetwork(
            fadeInDuration: const Duration(milliseconds: 250),
            placeholder: kTransparentImage,
            image: imageURL,
            fit: BoxFit.cover,
          ),
        ),
      );
    } else
      return Container();
  }

  Widget _buildText({@required BuildContext context}) {
    Widget titleWidget = Container();
    Widget infoWidget = Container();
    final String title = article.title;
    final String sourceName = article.sourceName;

    if (title != null) {
      titleWidget = Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      );
    }

    if (sourceName != null) {
      infoWidget = Align(
        alignment: Alignment.centerLeft,
        child: Text(sourceName),
      );
    }

    return Padding(
      padding: const EdgeInsets.only(left: 4.0),
      child: Column(
        children: <Widget>[titleWidget, infoWidget],
      ),
    );
  }
}

List<Widget> buildArticleCardList({@required List<ArticleModel> articles}) {
  var widgetList = <Widget>[];

  for (var i = 0; i < articles.length; i++) {
    widgetList.add(ArticleCard(article: articles[i]));
  }

  return widgetList;
}
