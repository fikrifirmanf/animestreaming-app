import 'package:flutter/material.dart';
import 'package:fnime_streaming/src/constant/string.dart';
import 'package:fnime_streaming/src/controllers/anime/anime_stream_controller.dart';
import 'package:fnime_streaming/src/pages/anime/stream/anime_stream_detail.dart';
import 'package:get/get.dart';

class AnimeStream extends StatelessWidget {
  String? slug, imgUrl;
  AnimeStream({Key? key, required this.slug, required this.imgUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AnimeStreamController as =
        Get.put(AnimeStreamController()..fetcAnimeStream(slug));

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: SafeArea(
        top: false,
        bottom: false,
        child: Obx(() {
          return SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: as.isLoading.value
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(imgUrl!),
                              fit: BoxFit.cover,
                              colorFilter: ColorFilter.mode(
                                  Colors.black.withOpacity(0.8),
                                  BlendMode.screen))),
                      child: GestureDetector(
                        onTap: () => Get.to(() => AnimeStreamDetail(
                            url: as.animeList.value.data?.streamUrl)),
                        child: const Center(
                            child: Icon(
                          Icons.play_circle_fill_rounded,
                          color: bgColor,
                          size: 100,
                        )),
                      ),
                    ));
        }),
      ),
    );
  }
}
