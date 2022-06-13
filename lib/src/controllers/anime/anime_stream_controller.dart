import 'package:fnime_streaming/src/models/anime/anime_stream_models.dart';
import 'package:fnime_streaming/src/services/anime_service.dart';
import 'package:get/get.dart';

class AnimeStreamController extends GetxController {
  var isLoading = true.obs;
  var animeList = AnimeStreamModels().obs;

  // @override
  // void onInit() {

  //   super.onInit();
  // }

  void fetcAnimeStream(String? slug) async {
    try {
      isLoading(true);
      var resp = await AnimeService.getAnimeStream(slug);

      if (resp == 'error') {
        Get.snackbar('Error', 'Terjadi kesalahan!');
      } else {
        animeList.value = animeStreamModelsFromJson(resp);
      }
    } finally {
      isLoading(false);
    }
  }
}
