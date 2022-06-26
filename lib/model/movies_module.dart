// To parse this JSON data, do
//
//     final movies = moviesFromJson(jsonString);

import 'dart:convert';

List<Movies> moviesFromJson(String str) =>
    List<Movies>.from(json.decode(str).map((x) => Movies.fromJson(x)));

String moviesToJson(List<Movies> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Movies {
  Movies({
    required this.id,
    required this.name,
    required this.desc,
    required this.dlink,
    required this.movieImg,
    required this.lang,
    required this.cat,
    required this.rating,
    required this.createdAt,
    required this.v,
  });

  String id;
  String name;
  String desc;
  String dlink;
  String movieImg;
  String lang;
  String cat;
  int rating;
  DateTime createdAt;
  int v;

  factory Movies.fromJson(Map<String, dynamic> json) => Movies(
        id: json["_id"],
        name: json["name"],
        desc: json["desc"],
        dlink: json["dlink"],
        movieImg: json["movieImg"],
        lang: json["lang"],
        cat: json["cat"],
        rating: json["rating"],
        createdAt: DateTime.parse(json["created_at"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "desc": desc,
        "dlink": dlink,
        "movieImg": movieImg,
        "lang": lang,
        "cat": cat,
        "rating": rating,
        "created_at": createdAt.toIso8601String(),
        "__v": v,
      };
}
