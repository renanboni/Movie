import 'dart:async';
import 'package:http/http.dart' show Client;
import 'dart:convert';
import '../models/item_model.dart';

class MovieApiProvider {
  Client client = Client();
  final _apiKey = '71a83c7ed6602178bb46311261c9b8a5';

  Future<ItemModel> fetchMovieList() async {
    final response = await client
        .get("http://api.themoviedb.org/3/movie/popular?api_key=$_apiKey");

    if (response.statusCode == 200) {
      return ItemModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load post');
    }
  }
}
