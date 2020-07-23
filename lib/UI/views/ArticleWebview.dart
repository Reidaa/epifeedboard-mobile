import 'dart:async';

import 'package:epiflipboard/UI/components/InteractionBottomBar.dart';
import 'package:epiflipboard/models/models.dart';

import 'package:epiflipboard/utils.dart' as helper;
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleWebview extends StatefulWidget {
  final ArticleModel article;

  const ArticleWebview({Key key, @required this.article}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ArticleWebviewState();
  }
}

class _ArticleWebviewState extends State<ArticleWebview> {
  Completer<WebViewController> _controller = Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: Text(helper.extractDomain(widget.article.articleUrl))),
      body: Column(
        children: <Widget>[
          Expanded(
            child: WebView(
              initialUrl: widget.article.articleUrl,
              javascriptMode: JavascriptMode.disabled,
              onWebViewCreated: (WebViewController webViewController) {
                _controller.complete(webViewController);
              },
              onPageFinished: (String url) => {},
            ),
          ),
          InteractionBottomBar(),
        ],
      ),
    );
  }
}

buildWebViewArticle(
    {@required BuildContext context, @required ArticleModel article}) {
  return Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => ArticleWebview(article: article),
    ),
  );
}
