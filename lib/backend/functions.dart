import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:tech_news_app/backend/model.dart';
import 'package:tech_news_app/componenets/search_bar.dart';
import 'package:tech_news_app/utils/key.dart' as customkey;

class NewsApi {
  static final String _techNewsUrl =
      'https://newsapi.org/v2/top-headlines?country=us&category=technology&pageSize=100&apiKey=${customkey.Key.key}&q=${SearchBarr.searchController.text}';

  Future<List<TrendingNews>> fetchNews() async {
    final response = await http.get(
      Uri.parse(_techNewsUrl),
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body)['articles'] as List;
      final articles = data.map((json) => TrendingNews.fromJson(json)).toList();
      if (kDebugMode) {
        print(articles);
      }
      return articles;
    } else {
      throw Exception('$response.statusCode');
    }
    // final articles = data.map((dynamic item) => item as Map<String, dynamic>);
    //     print(articles);
    //     return articles.toList();
    // Map result = jsonDecode(response.body);
    // print("fetched");
    // return result['articles'];
  }
}
