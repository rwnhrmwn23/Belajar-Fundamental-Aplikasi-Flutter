import 'package:dicoding_news_app/widgets/custom_scaffold.dart';
import 'package:flutter/cupertino.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleWebPage extends StatelessWidget {
  static const routeName = '/article_web';

  final String url;

  const ArticleWebPage({required this.url});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: WebView(
        initialUrl: url,
      ),
    );
  }
}
