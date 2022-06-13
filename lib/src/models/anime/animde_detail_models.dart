// To parse this JSON data, do
//
//     final animeDetailModels = animeDetailModelsFromJson(jsonString);

import 'dart:convert';

AnimeDetailModels animeDetailModelsFromJson(String str) =>
    AnimeDetailModels.fromJson(json.decode(str));

String animeDetailModelsToJson(AnimeDetailModels data) =>
    json.encode(data.toJson());

class AnimeDetailModels {
  AnimeDetailModels({
    this.data,
  });

  Data? data;

  factory AnimeDetailModels.fromJson(Map<String, dynamic> json) =>
      AnimeDetailModels(
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
      };
}

class Data {
  Data({
    this.animeTitle,
    this.score,
    this.imgUrl,
    this.producer,
    this.status,
    this.totalEpisode,
    this.duration,
    this.releaseDate,
    this.studio,
    this.genre,
    this.episodeList,
  });

  String? animeTitle;
  String? score;
  String? imgUrl;
  String? producer;
  String? status;
  String? totalEpisode;
  String? duration;
  String? releaseDate;
  String? studio;
  String? genre;
  List<EpisodeList>? episodeList;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        animeTitle: json["anime_title"],
        score: json["score"],
        imgUrl: json["img_url"],
        producer: json["producer"],
        status: json["status"],
        totalEpisode: json["total_episode"],
        duration: json["duration"],
        releaseDate: json["release_date"],
        studio: json["studio"],
        genre: json["genre"],
        episodeList: List<EpisodeList>.from(
            json["episode_list"].map((x) => EpisodeList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "anime_title": animeTitle,
        "score": score,
        "img_url": imgUrl,
        "producer": producer,
        "status": status,
        "total_episode": totalEpisode,
        "duration": duration,
        "release_date": releaseDate,
        "studio": studio,
        "genre": genre,
        "episode_list": List<dynamic>.from(episodeList!.map((x) => x.toJson())),
      };
}

class EpisodeList {
  EpisodeList({
    this.episodeTitle,
    this.episodeReleaseDate,
    this.episodeSlug,
  });

  String? episodeTitle;
  String? episodeReleaseDate;
  String? episodeSlug;

  factory EpisodeList.fromJson(Map<String, dynamic> json) => EpisodeList(
        episodeTitle: json["episode_title"],
        episodeReleaseDate: json["episode_release_date"],
        episodeSlug: json["episode_slug"],
      );

  Map<String, dynamic> toJson() => {
        "episode_title": episodeTitle,
        "episode_release_date": episodeReleaseDate,
        "episode_slug": episodeSlug,
      };
}
