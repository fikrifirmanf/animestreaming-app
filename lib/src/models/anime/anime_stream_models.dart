// To parse this JSON data, do
//
//     final animeStreamModels = animeStreamModelsFromJson(jsonString);

import 'dart:convert';

AnimeStreamModels animeStreamModelsFromJson(String str) =>
    AnimeStreamModels.fromJson(json.decode(str));

String animeStreamModelsToJson(AnimeStreamModels data) =>
    json.encode(data.toJson());

class AnimeStreamModels {
  AnimeStreamModels({
    this.data,
  });

  Data? data;

  factory AnimeStreamModels.fromJson(Map<String, dynamic> json) =>
      AnimeStreamModels(
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data!.toJson(),
      };
}

class Data {
  Data({
    this.animeTitle,
    this.streamUrl,
    this.nextEpisode,
    this.prevEpisode,
  });

  String? animeTitle;
  String? streamUrl;
  String? nextEpisode;
  String? prevEpisode;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        animeTitle: json["anime_title"],
        streamUrl: json["stream_url"],
        nextEpisode: json["next_episode"],
        prevEpisode: json["prev_episode"],
      );

  Map<String, dynamic> toJson() => {
        "anime_title": animeTitle,
        "stream_url": streamUrl,
        "next_episode": nextEpisode,
        "prev_episode": prevEpisode,
      };
}
