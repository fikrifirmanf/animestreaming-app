import 'package:flutter/material.dart';
import 'package:fnime_streaming/src/constant/dimension.dart';
import 'package:fnime_streaming/src/constant/string.dart';
import 'package:fnime_streaming/src/controllers/anime/anime_controller.dart';
import 'package:fnime_streaming/src/pages/anime/all/anime_all.dart';
import 'package:fnime_streaming/src/pages/anime/detail/anime_detail.dart';
import 'package:fnime_streaming/src/pages/home/widget/card_list.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  final AnimeController ac =
      Get.put(AnimeController()..fetcAnime('on-going', 1));

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: bgColor,
        appBar: AppBar(
            title: const Text('Fnime Streaming'), backgroundColor: bgColor),
        body: SafeArea(
            top: false,
            bottom: false,
            child: Obx(() {
              return ListView(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // const Padding(
                      //   padding: globalPadding,
                      //   child: Text(
                      //     'Continue Watching',
                      //     style: cardSectionTitle,
                      //   ),
                      // ),
                      // SizedBox(
                      //   width: width,
                      //   height: 200,
                      //   child: CardList(title: 'Continue', episode: 'Continue'),
                      // ),
                      Padding(
                        padding: globalPadding,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'On-going Anime',
                              style: cardSectionTitle,
                            ),
                            GestureDetector(
                              onTap: (() => Get.to(() => AnimeAll())),
                              child: Text(
                                'See all',
                                style: seeAllTextStyle,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: width,
                        height: 200,
                        child: (ac.isLoading.value == true)
                            ? const Center(
                                child: CircularProgressIndicator(),
                              )
                            : ListView.builder(
                                itemCount: 5,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, i) {
                                  var anime = ac.animeList.value.data;
                                  return Padding(
                                    padding: i == 0
                                        ? const EdgeInsets.only(left: 28)
                                        : i == 5 - 1
                                            ? const EdgeInsets.only(
                                                right: 28, left: 28)
                                            : const EdgeInsets.only(left: 28),
                                    child: GestureDetector(
                                      onTap: () => Get.to(() => AnimeDetailPage(
                                            slug: anime?[i].slug,
                                          )),
                                      child: CardList(
                                        title: anime![i].animeTitle.toString(),
                                        episode:
                                            anime[i].animeEpisode.toString(),
                                        imgUrl: anime[i].imgUrl.toString(),
                                        slug: anime[i].slug.toString(),
                                      ),
                                    ),
                                  );
                                }),
                      ),
                      Padding(
                        padding: globalPadding,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              'Complete Anime',
                              style: cardSectionTitle,
                            ),
                            Text(
                              'See all',
                              style: seeAllTextStyle,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: width,
                        height: 200,
                        child: CardList(
                            title: 'Continue',
                            episode: 'Continue',
                            imgUrl: null,
                            slug: null),
                      )
                    ],
                  ),
                ],
              );
            })));
  }
}
