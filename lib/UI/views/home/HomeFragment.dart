import 'package:epiflipboard/UI/views/ArticleWidget.dart';
import 'package:epiflipboard/UI/views/home/StartingPage.dart';
import 'file:///C:/Users/Moi/Documents/GitLab/epiflipboard/epiflipboard-app/lib/models/Article.dart';
import 'file:///C:/Users/Moi/Documents/GitLab/epiflipboard/epiflipboard-app/lib/repositories/api.dart' as api;
import 'package:flutter/material.dart';

class HomeFragment extends StatefulWidget {
  @override
  _HomeFragmentState createState() => _HomeFragmentState();
}

class _HomeFragmentState extends State<HomeFragment> {
  List<ArticleModel> _articles;

  void _updateArticles() {
//    _articles = api.getArticles();
  }

  void refresh() {
    setState(() {
      _updateArticles();
    });
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      _updateArticles();
    });
  }

  @override
  Widget build(BuildContext context) {
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
  }
}
