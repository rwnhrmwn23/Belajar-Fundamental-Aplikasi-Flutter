import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleWebPage extends StatelessWidget {
  static const routeName = '/article_web';

  final String url;

  const ArticleWebPage({required this.url});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News App'),
      ),
      body: WebView(
        initialUrl: url,
      ),
    );
  }
}
