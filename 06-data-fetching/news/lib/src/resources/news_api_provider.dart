import 'dart:convert';
import 'dart:io';
import 'package:news/src/models/item_model.dart';

import 'package:http/http.dart' as http;

final _root = 'https://hacker-news.firebaseio.com/v0';

class NewsApiProvider {
  HttpClient httpClient = HttpClient();
  fetchTopIds() async {
    var url = Uri.https('$_root/topstories.json');

    var response = await http.get(url);

    final ids = json.decode(response.body);

    return ids;
  }

  fetchItem(int id) async {
    var url = Uri.https('$_root/item/$id.json');

    var response = await http.get(url);

    final parsedJson = json.decode(response.body);

    return ItemModel.fromJson(parsedJson);
  }
}
