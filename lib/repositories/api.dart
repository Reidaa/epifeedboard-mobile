import '../models/Article.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class API {
  final _baseUrl = "http://172.22.62.175:3000";

  API();

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
