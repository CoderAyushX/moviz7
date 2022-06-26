import 'package:crud/model/movies_module.dart';
import 'package:http/http.dart' as http;

import '../model/topmovies_module.dart';

class RemoteServices {
  static var client = http.Client();

  static Future<List<TopMovies>> fetchTopMovies(String url) async {
    http.Response response = await client.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return topMoviesFromJson(jsonString);
    } else {
      return [];
    }
  }

    static Future<List<Movies>> fetchMovies( String url) async {
    http.Response response = await client.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return moviesFromJson(jsonString);
    } else {
      return [];
    }
  }
}
