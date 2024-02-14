import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:tech_news_app/backend/model.dart';
import 'package:tech_news_app/utils/key.dart' as customkey;

class NewsApi {
  Future<List<TrendingNews>> fetchNews(String query) async {
    final String techNewsUrl =
        'https://newsapi.org/v2/top-headlines?country=us&category=technology&pageSize=100&apiKey=${customkey.Key.key}&q=$query';
    final response = await http.get(
      Uri.parse(techNewsUrl),
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body)['articles'] as List;
      final articles = data.map((dynamic item) => item as Map<String, dynamic>);
      if (kDebugMode) {
        print(articles);
      }
      return articles
          .map((dynamic item) => TrendingNews.fromJson(item))
          .toList();
    } else {
      throw Exception('$response.statusCode');
    }
    // final articles = data.map((json) => TrendingNews.fromJson(json)).toList();
    // if (kDebugMode) {
    //   print(articles);
    // }
    // return articles;
    /////
    // Map result = jsonDecode(response.body);
    // print("fetched");
    // return result['articles'];
  }
}
