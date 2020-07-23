import 'package:epiflipboard/UI/views/ArticleWidget.dart';
import 'package:epiflipboard/UI/views/home/StartingPage.dart';
import 'package:epiflipboard/models/models.dart';
import 'package:epiflipboard/repositories/api.dart';
import 'package:flutter/material.dart';

class HomeFragment extends StatefulWidget {
  @override
  _HomeFragmentState createState() => _HomeFragmentState();
}

class _HomeFragmentState extends State<HomeFragment> {
  List<ArticleModel> _articles = [];
  API _api = API();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _api.testFetchArticles(),
      builder:
          (BuildContext context, AsyncSnapshot<List<ArticleModel>> snapshot) {
        if (snapshot.hasData) {
          _articles = snapshot.data;

          var widgetList = buildArticlesWidgetList(
              articles: _articles.getRange(3, _articles.length).toList());
          widgetList.insert(
              0, StartingPage(articles: _articles.getRange(0, 3).toList()));

          return Scaffold(
            body: PageView(
              scrollDirection: Axis.vertical,
              children: widgetList,
            ),
          );
        } else {
          return Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }
      },
    );
  }
}
