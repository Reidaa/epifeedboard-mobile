import 'package:flutter/material.dart';

import 'card/ArticleCard.dart';
// import 'page/ArticlePage.dart';
// import 'page/StartingPage.dart';
import '../../../models/models.dart';
import '../../../network/api.dart';

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
      future: _api.fetchArticles(),
      builder:
          (BuildContext context, AsyncSnapshot<List<ArticleModel>> snapshot) {
        if (snapshot.hasData) {
          _articles = snapshot.data;
          return Scaffold(
            appBar: AppBar(
              elevation: 2,
              title: Text("EPIFLIPBOARD"),
            ),
            body: _buildCardView(articles: _articles),
          );
        } else {
          return Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }
      },
    );
  }

  // Widget _buildPageView({@required List<ArticleModel> articles}) {
  //   var widgetList = buildArticlesPageList(
  //       articles: _articles.getRange(3, _articles.length).toList());
  //   widgetList.insert(
  //       0, StartingPage(articles: _articles.getRange(0, 3).toList()));

  //   return PageView(
  //     scrollDirection: Axis.vertical,
  //     children: widgetList,
  //   );
  // }

  Widget _buildCardView({@required List<ArticleModel> articles}) {
    var widgetList = buildArticleCardList(articles: _articles);
    return ListView(
      scrollDirection: Axis.vertical,
      children: widgetList,
    );
  }
}
