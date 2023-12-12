import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tech_news_app/componenets/search_bar.dart';
import 'package:tech_news_app/utils/key.dart';

Future<List> fetchNews() async {
  final response = await http.get(
    Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=us&category=technology&pageSize=100&apiKey=${Key.key}&q=${SearchBarr.searchController.text}'),
  );

  if (response.statusCode == 200) {
    final List<dynamic> data = jsonDecode(response.body)['articles'] as List;
    final articles = data.map((dynamic item) => item as Map<String, dynamic>);
    print(articles);
    return articles.toList();
  } else {
    throw Exception('$response.statusCode');
  }

  // Map result = jsonDecode(response.body);
  // print("fetched");
  // return result['articles'];
}
