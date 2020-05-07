import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class KnowMore extends StatefulWidget {
  @override
  _KnowMoreState createState() => _KnowMoreState();
}

class _KnowMoreState extends State<KnowMore> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('COVID19'),
      ),
      body: WebView(
        initialUrl:
            'https://www.who.int/emergencies/diseases/novel-coronavirus-2019/events-as-they-happen',
        onWebViewCreated: (WebViewController webViewController) {
          _controller.complete(webViewController);
        },
      ),
    );
  }
}
