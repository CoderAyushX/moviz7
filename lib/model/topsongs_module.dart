// To parse this JSON data, do
//
//     final topSongs = topSongsFromJson(jsonString);

import 'dart:convert';

List<TopSongs> topSongsFromJson(String str) =>
    List<TopSongs>.from(json.decode(str).map((x) => TopSongs.fromJson(x)));

String topSongsToJson(List<TopSongs> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TopSongs {
  TopSongs({
    required this.id,
    required this.name,
    required this.desc,
    required this.link,
    required this.songImg,
    required this.lang,
    required this.cat,
    required this.rate,
    required this.rating,
    required this.createdAt,
    required this.v,
  });

  String id;
  String name;
  String desc;
  String link;
  String songImg;
  String lang;
  String cat;
  String rate;
  int rating;
  DateTime createdAt;
  int v;

  factory TopSongs.fromJson(Map<String, dynamic> json) => TopSongs(
        id: json["_id"],
        name: json["name"],
        desc: json["desc"],
        link: json["link"],
        songImg: json["songImg"],
        lang: json["lang"],
        cat: json["cat"],
        rate: json["rate"],
        rating: json["rating"],
        createdAt: DateTime.parse(json["created_at"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "desc": desc,
        "link": link,
        "songImg": songImg,
        "lang": lang,
        "cat": cat,
        "rate": rate,
        "rating": rating,
        "created_at": createdAt.toIso8601String(),
        "__v": v,
      };
}
