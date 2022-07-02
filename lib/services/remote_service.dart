import 'dart:convert';

import 'package:crud/model/songs_module.dart';
import 'package:http/http.dart' as http;

import '../model/topsongs_module.dart';

class RemoteServices {
  static var client = http.Client();
  //? url
  final String _url = "http://localhost:8000/api/v1/";

  static Future<List<TopSongs>> fetchTopSongs(String url) async {
    http.Response response = await client.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return topSongsFromJson(jsonString);
    } else {
      return [];
    }
  }

  static Future<List<Songs>> fetchSongs(String url) async {
    http.Response response = await client.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return songsFromJson(jsonString);
    } else {
      return [];
    }
  }
 //? headers
  _setheaders() =>
      {"Content-Type": "application/json", "Accept": "application/json"};
  //* posting data
  postData(Map data, String apiUrl) async {
    var fullUrl = _url+apiUrl;
    return await http.post(Uri.parse(fullUrl),
        body: jsonEncode(data), headers: _setheaders());
  }
}
