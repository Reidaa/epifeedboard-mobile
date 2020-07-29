import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:math';

import '../models/Article.dart';

class API {
  final _baseUrl = "https://epiflipboard-api.herokuapp.com";
  List<ArticleModel> _articles = [];

  // List<String> _sourcesToFilter = ["youtube"];

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

  void offlineFillArticles() {
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

    this._articles = articles;
  }

  Future<void> updateArticles() async {
    final url = '$_baseUrl/news/headlines?country=fr';
    final response = await http.get(url);
    var articles = <ArticleModel>[];

    if (response.statusCode != 200) {
      throw new Exception("error getting articles");
    }
    final json = jsonDecode(response.body);
    for (int i = 0; i != json["data"]["articles"].length; i++) {
      var article = ArticleModel.fromJson(json["data"]["articles"][i]);
      articles.add(article);
    }
    this._articles = articles;
  }

  Future<List<ArticleModel>> fetchArticles() async {
    if (this._articles.isNotEmpty) return this._articles;
    try {
      await updateArticles();
    } catch (e) {
      offlineFillArticles();
    }
    return this._articles;
  }
}
