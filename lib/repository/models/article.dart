import 'dart:convert';

import 'package:news_app/imports.dart';

class Article {
  Source? source;
  String? author;
  String title;
  String? description;
  String url;
  String? urlToImage;
  String publishedAt;
  String? content;

  Article({
    this.source,
    this.author,
    required this.title,
    this.description,
    required this.url,
    this.urlToImage,
    required this.publishedAt,
    this.content,
  });

  factory Article.fromJson(Map<String, dynamic> jsn) {
    return Article(
      source: jsn['source'] != null
          ? jsn['source'].runtimeType == String
              ? Source.fromJson(json.decode(jsn['source']))
              : Source.fromJson(jsn['source'])
          : null,
      author: jsn['author'],
      title: jsn['title'],
      description: jsn['description'],
      url: jsn['url'],
      urlToImage: jsn['urlToImage'],
      publishedAt: jsn['publishedAt'],
      content: jsn['content'],
    );
  }
  String toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['source'] = source?.toJson();
    data['author'] = author;
    data['title'] = title;
    data['description'] = description;
    data['url'] = url;
    data['urlToImage'] = urlToImage;
    data['publishedAt'] = publishedAt;
    data['content'] = content;

    return json.encode(data);
  }
}
