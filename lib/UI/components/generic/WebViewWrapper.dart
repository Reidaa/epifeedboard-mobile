import 'dart:async';

import 'file:///C:/Users/Moi/Documents/GitLab/epiflipboard/epiflipboard-app/lib/utils.dart' as helper;
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewWrapper extends StatefulWidget {
  final String url;

  const WebViewWrapper({Key key, @required this.url}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _WebViewWrapperState();
  }
}

class _WebViewWrapperState extends State<WebViewWrapper> {
  Completer<WebViewController> _controller = Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(helper.extractDomain(widget.url))),
      body: WebView(
        initialUrl: widget.url,
        javascriptMode: JavascriptMode.disabled,
        onWebViewCreated: (WebViewController webViewController) {
          _controller.complete(webViewController);
        },
        onPageFinished: (String url) => {},
      ),
    );
  }
}
