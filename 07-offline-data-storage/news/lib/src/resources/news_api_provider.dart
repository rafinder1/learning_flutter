import 'dart:convert';
import 'package:news/src/models/item_model.dart';

import 'package:http/http.dart' as http;

const _root = 'hacker-news.firebaseio.com';

class NewsApiProvider {
  http.Client client = http.Client();

  Future<List<int>> fetchTopIds() async {
    var url = Uri.https(_root, '/v0/topstories.json');
    var response = await client.get(url);

    final ids = json.decode(response.body);

    return ids.cast<int>();
  }

  Future<ItemModel> fetchItem(int id) async {
    var url = Uri.https(_root, '/v0/item/$id.json');
    var response = await client.get(url);

    final parsedJson = json.decode(response.body);

    return ItemModel.fromJson(parsedJson);
  }
}
