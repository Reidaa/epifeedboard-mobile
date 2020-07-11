import '../models/Article.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:meta/meta.dart';

class API {
  final _baseUrl = "localhost:3000/";
  final http.Client httpClient;
  List<ArticleModel> _cachedArticle;

  API({
    @required this.httpClient,
  }) : assert(httpClient != null);

  Future<ArticleModel> fetchArticle() async {
    final url = '$_baseUrl/news';
    final response = await this.httpClient.get(url);

    if (response.statusCode != 200) {
      throw new Exception("error getting articles");
    }

    final json = jsonDecode(response.body);
    return ArticleModel.fromJson(json);

  }

  Future<List<ArticleModel>> getArticles({int start, int end}) async {
    if (start == null || end == null) {
      return _cachedArticle;
    } else {
      return _cachedArticle.getRange(start, end).toList();
    }
  }
}
