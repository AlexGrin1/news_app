import 'package:news_app/imports.dart';

class News {
  String status;
  int totalResults;
  List<Article> articles;

  News({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  factory News.fromJson(Map<String, dynamic> json) {
    var articleList = json['articles'] as List;
    List<Article> articles =
        articleList.map((i) => Article.fromJson(i)).toList();

    return News(
      status: json['status'],
      totalResults: json['totalResults'],
      articles: articles,
    );
  }
}
