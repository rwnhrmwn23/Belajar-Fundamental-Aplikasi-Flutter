import 'package:dicoding_news_app/data/model/article.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'article_web_view.dart';

class ArticleDetailPage extends StatelessWidget {
  static const routeName = '/article_detail';

  final Article article;

  const ArticleDetailPage({required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(article.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(article.urlToImage),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(article.description),
                  const Divider(color: Colors.grey),
                  Text(
                    article.title,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                  const Divider(color: Colors.grey),
                  Text('Date: ${article.publishedAt}'),
                  const SizedBox(height: 10),
                  Text('Author: ${article.author}'),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    child: const Text('Read More'),
                    onPressed: () {
                      Navigator.pushNamed(context, ArticleWebPage.routeName,
                          arguments: article.url);
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
