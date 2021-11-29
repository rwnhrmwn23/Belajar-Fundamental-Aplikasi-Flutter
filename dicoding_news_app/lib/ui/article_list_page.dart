import 'package:dicoding_news_app/widgets/platform_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../data/model/article.dart';
import 'article_detail_page.dart';

class ArticleListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PlatformWidget(
      androidBuilder: _buildAndroid,
      iosBuilder: _buildIos,
    );
  }

  Widget _buildAndroid(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News App'),
      ),
      body: _buildList(context),
    );
  }

  Widget _buildIos(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('News App'),
        transitionBetweenRoutes: false,
      ),
      child: _buildList(context),
    );
  }
}

Widget _buildList(BuildContext context) {
  return FutureBuilder<String>(
    future:
    DefaultAssetBundle.of(context).loadString('assets/article.json'),
    builder: (context, snapshot) {
      final List<Article> articles = parseArticles(snapshot.data);
      return ListView.builder(
        itemCount: articles.length,
        itemBuilder: (context, index) {
          return _buildArticleItem(context, articles[index]);
        },
      );
    },
  );
}

Widget _buildArticleItem(BuildContext context, Article article) {
  return Material(
    child: ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      leading: Image.network(
        article.urlToImage,
        width: 100,
      ),
      title: Text(article.title),
      subtitle: Text(article.author),
      onTap: () {
        Navigator.pushNamed(context, ArticleDetailPage.routeName, arguments: article);
      },
    ),
  );
}