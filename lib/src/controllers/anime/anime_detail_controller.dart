import 'package:fnime_streaming/src/models/anime/animde_detail_models.dart';
import 'package:fnime_streaming/src/services/anime_service.dart';
import 'package:get/get.dart';

class AnimeDetailController extends GetxController {
  var isLoading = true.obs;
  var animeList = AnimeDetailModels().obs;

  // @override
  // void onInit() {

  //   super.onInit();
  // }

  void fetcAnimeDetail(String? slug) async {
    try {
      isLoading(true);
      var resp = await AnimeService.getAnimeDetail(slug);

      if (resp == 'error') {
        Get.snackbar('Error', 'Terjadi kesalahan!');
      } else {
        animeList.value = animeDetailModelsFromJson(resp);
      }
    } finally {
      isLoading(false);
    }
  }
}
