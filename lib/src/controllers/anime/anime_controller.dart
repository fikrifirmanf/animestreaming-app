import 'package:fnime_streaming/src/models/anime/models.dart';
import 'package:fnime_streaming/src/services/anime_service.dart';
import 'package:get/get.dart';

class AnimeController extends GetxController {
  var isLoading = true.obs;
  var animeList = AnimeModels().obs;

  // @override
  // void onInit() {

  //   super.onInit();
  // }

  void fetcAnime(String? filterBy, int? page) async {
    try {
      isLoading(true);
      var resp = await AnimeService.getAnime(filterBy, page);

      if (resp == 'error') {
        Get.snackbar('Error', 'Terjadi kesalahan!');
      } else {
        animeList.value = animeModelsFromJson(resp);
      }
    } finally {
      isLoading(false);
    }
  }
}
