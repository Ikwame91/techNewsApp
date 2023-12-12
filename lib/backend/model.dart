//

import 'package:tech_news_app/utils/constants.dart';

class TrendingNews {
  dynamic author;
  String title;
  String description;
  String url;
  String urlToImage;
  DateTime publishedAt;
  dynamic content;

  TrendingNews({
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  factory TrendingNews.fromJson(Map<String, dynamic> json) => TrendingNews(
        author: json["author"] ?? "No author",
        title: json["title"] ?? "No title",
        description: json["description"] ?? "No description",
        url: json["url"] ?? "No url",
        urlToImage: json["urlToImage"] ?? Constants.imageurl,
        publishedAt:
            DateTime.parse(json["publishedAt"] ?? "2021-10-13T12:00:00Z"),
        content: json["content"] ?? "No content",
      );

  Map<String, dynamic> toJson() => {
        "author": author,
        "title": title,
        "description": description,
        "url": url,
        "urlToImage": urlToImage,
        "publishedAt": publishedAt.toIso8601String(),
        "content": content,
      };
}
