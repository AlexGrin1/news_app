import 'dart:developer';

import 'package:news_app/imports.dart';

class Controller {
  Future<News?> getTopHeadlinesNews({required int page}) async {
    ApiResponse response = await newsApi.getTopHeadlinesNews(page: page);
    if (response.statusCode == 200) {
      return News.fromJson(response.body);
    }
  }

  Future<News?> getEverythingNews({required int page}) async {
    ApiResponse response = await newsApi.getEverythingNews(page: page);
    return response.statusCode == 200 ? News.fromJson(response.body) : null;
  }
}
