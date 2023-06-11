import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:news_app/repository/models/article.dart';
import "package:path_provider/path_provider.dart";
import 'package:hive/hive.dart';

class LocalData {
  late Box<dynamic> storage;
  initializeLocalData() async {
    Directory dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);
    storage = await Hive.openBox("storage");
  }

  Future<List<Article>> getLocalData() async {
    var data = storage.values;
    log('data $data');
    return List.from(data)
        .map((e) => Article.fromJson(json.decode(e)))
        .toList();
  }

  isFavourites({required String key}) {
    return storage.get(key) != null && storage.get(key).isNotEmpty
        ? true
        : false;
  }

  saveToStorage({required String key, required String value}) {
    storage.put(key, value);
  }

  removeFromStorage({required String key}) {
    storage.delete(key);
  }
}
