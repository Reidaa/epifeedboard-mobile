import 'package:epiflipboard/models/Article.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:epiflipboard/UI/components/WrapOverflowText.dart';

class ArticleCard extends StatelessWidget {
  final compactSize = 200;
  final confortSize = 250;
  final ArticleModel article;

  const ArticleCard({Key key, @required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: <Widget>[
          _buildCover(context: context, imageUrl: article.imageUrl),
          _buildTitle(context: context, title: article.title),
          _buildInfos(context: context),
        ],
      ),
    );
  }

  Widget _buildCover(
      {@required BuildContext context, @required String imageUrl}) {
    if (imageUrl != null) {
      return Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        semanticContainer: true,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        child: Container(
          height: 200,
          width: MediaQuery.of(context).size.width,
          child: FadeInImage.memoryNetwork(
            fadeInDuration: const Duration(milliseconds: 250),
            placeholder: kTransparentImage,
            image: imageUrl,
            fit: BoxFit.cover,
          ),
        ),
      );
    } else
      return Container(height: 20);
  }

  Widget _buildTitle({@required BuildContext context, @required String title}) {
    return Padding(
      padding: const EdgeInsets.only(left: 4.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
    );
  }

  Widget _buildInfos({@required BuildContext context}) {
    return Padding(
      padding: const EdgeInsets.only(left: 4.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(article.sourceName),
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
