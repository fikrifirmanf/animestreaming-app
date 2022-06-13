// To parse this JSON data, do
//
//     final animeStreamingUrlModels = animeStreamingUrlModelsFromJson(jsonString);

import 'dart:convert';

AnimeStreamingUrlModels animeStreamingUrlModelsFromJson(String str) =>
    AnimeStreamingUrlModels.fromJson(json.decode(str));

String animeStreamingUrlModelsToJson(AnimeStreamingUrlModels data) =>
    json.encode(data.toJson());

class AnimeStreamingUrlModels {
  AnimeStreamingUrlModels({
    this.data,
  });

  Data? data;

  factory AnimeStreamingUrlModels.fromJson(Map<String, dynamic> json) =>
      AnimeStreamingUrlModels(
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data!.toJson(),
      };
}

class Data {
  Data({
    this.streamUrl,
  });

  String? streamUrl;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        streamUrl: json["stream_url"],
      );

  Map<String, dynamic> toJson() => {
        "stream_url": streamUrl,
      };
}
