import 'ArticleModel.dart';

class API {
  final String url = "";
  List<ArticleData> _cachedArticle;

  API() {
    _initArticlesList();
  }

  _initArticlesList() {
    var articles = <ArticleData>[];

    articles.add(BobArticle());
    articles.add(PatrickArticle());
    articles.add(CarlosArticle());
    articles.add(PatrickArticle());
    articles.add(BobArticle());
    articles.add(PatrickArticle());
    articles.add(PatrickArticle());
    articles.add(CarlosArticle());
    articles.add(PatrickArticle());
    articles.add(BobArticle());
    articles.add(PatrickArticle());
    articles.add(PatrickArticle());
    articles.add(CarlosArticle());
    articles.add(PatrickArticle());
    articles.add(BobArticle());
    articles.add(PatrickArticle());
    articles.add(PatrickArticle());
    articles.add(CarlosArticle());
    articles.add(PatrickArticle());
    articles.add(BobArticle());
    articles.add(PatrickArticle());

    _cachedArticle = articles;
  }

  Future<List<ArticleData>> getArticles({int start, int end}) async {
    if (start == null || end == null) {
      return _cachedArticle;
    } else {
      return _cachedArticle.getRange(start, end).toList();
    }
  }
}

List<ArticleData> getArticles() {
  List<ArticleData> articles = List();

  articles.add(CarlosArticle());
  articles.add(BobArticle());
  articles.add(PatrickArticle());
  articles.add(CarlosArticle());
  articles.add(BobArticle());
  articles.add(PatrickArticle());
  articles.add(CarlosArticle());
  articles.add(BobArticle());
  articles.add(PatrickArticle());
  articles.add(CarlosArticle());
  articles.add(BobArticle());
  articles.add(PatrickArticle());
  articles.add(CarlosArticle());
  articles.add(BobArticle());
  articles.add(PatrickArticle());
  articles.add(CarlosArticle());
  articles.add(BobArticle());
  articles.add(PatrickArticle());
  articles.add(CarlosArticle());

  return articles;
}
