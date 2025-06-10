import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:matule/layers/domain/entity/api_entity.dart';
import 'package:matule/layers/domain/entity/product_get_entity.dart';

class Api {
  Api._inctance();
  static final Api _api = Api._inctance();
  factory Api() => _api;

  Future<List<dynamic>> getPostFromPlace() async {
    var uri = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    final response = await http.get(uri);

    final data = (jsonDecode(response.body) as List);
    List<dynamic> list =
        data.map((e) {
          return ApiEntity(title: e['title'], body: e['body']);
        }).toList();
    return list;
  }

  Future<List<dynamic>> getProductFromPlace() async {
    var uri = Uri.parse('https://jsonplaceholder.typicode.com/albums');
    final response = await http.get(uri);

    final data = (jsonDecode(response.body) as List);
    List<dynamic> list =
        data.map((e) {
          return ProductGetEntity(name: e['title'], price: e['id'], id: e['id'], category: e['userId'],);
        }).toList();
    return list;
  }
}
