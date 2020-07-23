import '../models/Article.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:math';

class API {
  final _baseUrl = "http://172.22.62.175:3000";
  final client = http.Client();

  API();

  Future<List<ArticleModel>> testFetchArticles() async {
    var rng = Random();
    var articles = <ArticleModel>[];

    for (int i = 0; i != 25; i++) {
      switch (rng.nextInt(3)) {
        case 0:
          articles.add(CarlosArticle());
          break;
        case 1:
          articles.add(BobArticle());
          break;
        case 2:
          articles.add(PatrickArticle());
          break;
      }
    }
    return articles;
  }

  Future<List<ArticleModel>> fetchArticles() async {
    final url = '$_baseUrl/news';
    final response = await http.get(url);
    var _articles = <ArticleModel>[];

    if (response.statusCode != 200) {
      throw new Exception("error getting articles");
    }

    final json = jsonDecode(response.body);
    for (int i = 0; i != json["data"]["articles"].length; i++) {
      var article = ArticleModel.fromJson(json["data"]["articles"][i]);
      _articles.add(article);
    }
    return _articles;
  }
}
