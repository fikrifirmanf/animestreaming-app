import 'package:flutter/material.dart';
import 'package:fnime_streaming/src/constant/string.dart';
import 'package:fnime_streaming/src/controllers/anime/anime_controller.dart';
import 'package:fnime_streaming/src/pages/anime/detail/anime_detail.dart';
import 'package:fnime_streaming/src/pages/home/widget/card_basic.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';

class AnimeAll extends StatelessWidget {
  final AnimeController ac =
      Get.put(AnimeController()..fetcAnime('on-going', 1));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: bgColor,
          title: const Text('Detail'),
        ),
        backgroundColor: bgColor,
        body: SafeArea(
            top: false,
            child: ac.isLoading.value
                ? Container(
                    child: const Center(
                    child: const CircularProgressIndicator(),
                  ))
                : ListView.builder(
                    itemCount: ac.animeList.value.data?.length,
                    itemBuilder: (context, index) {
                      var anime = ac.animeList.value.data;
                      return Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: GestureDetector(
                          onTap: () => Get.to(() => AnimeDetailPage(
                                slug: anime?[index].slug,
                              )),
                          child: CardBasic(
                            imgUrl: anime?[index].imgUrl,
                            animeTitle: anime?[index].animeTitle,
                            animeGenre: anime?[index].animeEpisode,
                          ),
                        ),
                      );
                    })));
  }
}
