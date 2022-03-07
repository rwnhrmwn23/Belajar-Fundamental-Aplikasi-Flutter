import 'dart:convert';

import 'package:dicoding_news_app/common/data/model/article.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String _baseUrl = 'http://newsapi.org/v2/';
  static const String _apiKey = '7805730036a34f73ad5196776a5e2a72';
  static const String _category = 'business';
  static const String _country = 'id';

  Future<ArticleResult> topHeadlines() async {
    final response = await http.get(Uri.parse(_baseUrl +
        "top-headlines?country=$_country&category=$_category&apiKey=$_apiKey"));
    if (response.statusCode == 200) {
      return ArticleResult.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to Load Top Headlines');
    }
  }
}
