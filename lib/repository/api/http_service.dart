import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiResponse<T> {
  int statusCode;
  Map<String, dynamic> body;
  ApiResponse({required this.statusCode, required this.body});

  factory ApiResponse.fromJson(int statusCode, Map<String, dynamic> json) {
    return ApiResponse<T>(statusCode: statusCode, body: json);
  }
}

class NewsApi {
  final String baseUrl = 'https://newsapi.org/v2';
  final String _apiKey =
      '0fb0db55b74e4efa81ce182d12de2a6e'; //'38823f356abb4c6d9fa19f68dd78b40b';
  final String country = 'us';
  final String questionRequest = 'apple';
  final int pageSize = 15;

  getRequest({required String url, Map<String, String>? headers}) async {
    int? statusCode;
    try {
      var response = await http.get(Uri.parse(url));

      statusCode = response.statusCode;

      return ApiResponse(
          statusCode: statusCode, body: json.decode(response.body));
    } catch (e) {
      return ApiResponse.fromJson(statusCode ?? 0, {"error": "$e"});
    }
  }

  Future<ApiResponse> getEverythingNews({required int page}) async {
    String url =
        "$baseUrl/everything?q=$questionRequest&page=$page&pageSize=$pageSize&apiKey=$_apiKey";

    ApiResponse response = await getRequest(url: url);
    return ApiResponse.fromJson(response.statusCode, response.body);
  }

  Future<ApiResponse> getTopHeadlinesNews({required int page}) async {
    String url = "$baseUrl/top-headlines?country=$country&apiKey=$_apiKey";

    ApiResponse response = await getRequest(url: url);
    return ApiResponse.fromJson(response.statusCode, response.body);
  }
}
