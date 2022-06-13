// To parse this JSON data, do
//
//     final animeModels = animeModelsFromJson(jsonString);

import 'dart:convert';

AnimeModels animeModelsFromJson(String str) =>
    AnimeModels.fromJson(json.decode(str));

String animeModelsToJson(AnimeModels data) => json.encode(data.toJson());

class AnimeModels {
  AnimeModels({
    this.data,
  });

  List<Datum>? data;

  factory AnimeModels.fromJson(Map<String, dynamic> json) => AnimeModels(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.animeTitle,
    this.animeEpisode,
    this.imgUrl,
    this.slug,
  });

  String? animeTitle;
  String? animeEpisode;
  String? imgUrl;
  String? slug;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        animeTitle: json["anime_title"],
        animeEpisode: json["anime_episode"],
        imgUrl: json["img_url"],
        slug: json["slug"],
      );

  Map<String, dynamic> toJson() => {
        "anime_title": animeTitle,
        "anime_episode": animeEpisode,
        "img_url": imgUrl,
        "slug": slug,
      };
}
