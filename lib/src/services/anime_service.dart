import 'package:fnime_streaming/src/constant/api_url.dart';
import 'package:http/http.dart' as http;

class AnimeService {
  static var client = http.Client();

  static Future<dynamic> getAnime(String? filterBy, int? page) async {
    var response = await client.get(
        Uri.parse('${ApiUrl.baseUrl}anime?filter_by=$filterBy&page=$page'),
        headers: {'Content-Type': 'application/json'});

    if (response.statusCode == 200) {
      var json = response.body;

      return json;
    } else {
      return 'error';
    }
  }

  static Future<dynamic> getAnimeDetail(
    String? slug,
  ) async {
    var response = await client.get(
        Uri.parse('${ApiUrl.baseUrl}anime/$slug/detail'),
        headers: {'Content-Type': 'application/json'});

    if (response.statusCode == 200) {
      var json = response.body;
      return json;
    } else {
      return 'error';
    }
  }

  static Future<dynamic> getAnimeStream(
    String? slug,
  ) async {
    var response = await client.get(
        Uri.parse('${ApiUrl.baseUrl}anime/$slug/stream'),
        headers: {'Content-Type': 'application/json'});

    if (response.statusCode == 200) {
      var json = response.body;
      return json;
    } else {
      return 'error';
    }
  }

  static Future<dynamic> getAnimeStreamingUrl(
    String? url,
  ) async {
    var response = await client.get(
        Uri.parse('${ApiUrl.baseUrl}anime/streaming?url=$url'),
        headers: {'Content-Type': 'application/json'});

    if (response.statusCode == 200) {
      var json = response.body;
      return json;
    } else {
      return 'error';
    }
  }
}
