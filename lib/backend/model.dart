//

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
        url: json["url"] ??
            "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.123rf.com%2Fphoto_104150274_stock-vector-no-image-available-icon-vector-flat-cartoon-illustration.html&psig=AOvVaw0QZ3Z4Z6Z4Z6Z4Z6Z4Z6Z4&ust=1634177229124000&source=images&cd=vfe&ved=0CAsQjRxqFwoTCJjQ4ZqH0_MCFQAAAAAdAAAAABAD",
        urlToImage: json["urlToImage"] ??
            "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.123rf.com%2Fphoto_104150274_stock-vector-no-image-available-icon-vector-flat-cartoon-illustration.html&psig=AOvVaw0QZ3Z4Z6Z4Z6Z4Z6Z4Z6Z4&ust=1634177229124000&source=images&cd=vfe&ved=0CAsQjRxqFwoTCJjQ4ZqH0_MCFQAAAAAdAAAAABAD",
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
