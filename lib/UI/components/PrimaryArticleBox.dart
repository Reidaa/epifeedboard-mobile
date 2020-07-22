import 'package:epiflipboard/UI/views/ArticleWebview.dart';
import 'package:epiflipboard/models/models.dart';
import 'package:flutter/material.dart';

class PrimaryArticleBox extends StatelessWidget {
  final ArticleModel article;

  const PrimaryArticleBox({Key key, @required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => buildWebViewArticle(context: context, article: article),
      child: Stack(
        children: <Widget>[
          _buildDarkenedCover(context: context),
          _buildInfo(context: context),
          Positioned(
            right: 8,
            bottom: 8,
            child: IconButton(
              onPressed: () => {print("options")},
              color: Colors.white,
              icon: Icon(Icons.more_vert),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDarkenedCover({@required BuildContext context}) {
    return ColorFiltered(
      colorFilter:
          ColorFilter.mode(Colors.black.withOpacity(0.35), BlendMode.darken),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(article.imageUrl),
          ),
        ),
      ),
    );
  }

  Widget _buildInfo({@required BuildContext context}) {
    return Container(
      width: ((MediaQuery.of(context).size.width) / 10.0) * 9,
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        verticalDirection: VerticalDirection.up,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 1.5),
            child: Text(
              article.sourceUrl,
              style: TextStyle(color: Colors.white),
            ),
          ),
          Text(
            article.title,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 30, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
