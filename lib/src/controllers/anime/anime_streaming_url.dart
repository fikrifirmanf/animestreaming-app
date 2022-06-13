import 'package:fnime_streaming/src/models/anime/anime_streaming_url_models.dart';
import 'package:fnime_streaming/src/services/anime_service.dart';
import 'package:get/get.dart';

class AnimeStreamingUrlController extends GetxController {
  var isLoading = true.obs;
  var animeList = AnimeStreamingUrlModels().obs;

  // @override
  // void onInit() {

  //   super.onInit();
  // }

  void fetchAnimeStreamingUrl(String? url) async {
    try {
      isLoading(true);
      var resp = await AnimeService.getAnimeStreamingUrl(url);

      if (resp == 'error') {
        Get.snackbar('Error', 'Terjadi kesalahan!');
      } else {
        animeList.value = animeStreamingUrlModelsFromJson(resp);
      }
    } finally {
      isLoading(false);
    }
  }
}
