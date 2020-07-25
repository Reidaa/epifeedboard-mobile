import 'package:epiflipboard/UI/components/ArticleWebview.dart';
import 'package:epiflipboard/models/models.dart';
import 'package:flutter/material.dart';

class SecondaryArticleBox extends StatelessWidget {
  final ArticleModel article;

  const SecondaryArticleBox({Key key, @required this.article})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: () => buildWebViewArticle(context: context, article: article),
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 60,
              child: _buildCover(context: context),
            ),
            Expanded(
              flex: 40,
              child: Placeholder(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCover({@required BuildContext context}) {
    if (article.imageUrl == null) return Container();
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(article.imageUrl),
        ),
      ),
    );
  }
}
