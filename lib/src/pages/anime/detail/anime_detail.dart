import 'package:flutter/material.dart';
import 'package:fnime_streaming/src/constant/dimension.dart';
import 'package:fnime_streaming/src/constant/string.dart';
import 'package:fnime_streaming/src/controllers/anime/anime_detail_controller.dart';
import 'package:fnime_streaming/src/pages/anime/stream/anime_stream.dart';
import 'package:get/get.dart';

class AnimeDetailPage extends StatelessWidget {
  String? slug;
  AnimeDetailPage({Key? key, required this.slug}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AnimeDetailController ad =
        Get.put(AnimeDetailController()..fetcAnimeDetail(slug));

    return Scaffold(
        backgroundColor: bgColor,
        body: SafeArea(
            top: false,
            bottom: false,
            child: Obx(() {
              return SingleChildScrollView(
                child: ad.isLoading.value
                    ? SizedBox(
                        height: MediaQuery.of(context).size.height,
                        child: const Center(
                          child: CircularProgressIndicator(),
                        ))
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              ShaderMask(
                                shaderCallback: (rect) {
                                  return LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Colors.black.withOpacity(1),
                                      Colors.transparent
                                    ],
                                  ).createShader(Rect.fromLTRB(
                                      0, 0, rect.width, rect.height));
                                },
                                blendMode: BlendMode.dstIn,
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height:
                                      MediaQuery.of(context).size.height / 2,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(ad.animeList.value
                                                  .data?.imgUrl ??
                                              'https://i.pinimg.com/originals/f7/d1/36/f7d136d44bbad6846e1385711a6a634b.png'),
                                          fit: BoxFit.cover)),
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height / 2,
                                decoration: const BoxDecoration(
                                  color: Colors.transparent,
                                ),
                                child: Padding(
                                  padding: globalPadding,
                                  child: Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Icon(
                                              Icons.star,
                                              color: Colors.yellow,
                                              size: 16,
                                            ),
                                            const SizedBox(width: 8),
                                            Text(
                                              ad.animeList.value.data?.score ==
                                                          null ||
                                                      ad.animeList.value.data
                                                              ?.score ==
                                                          ""
                                                  ? "-"
                                                  : ad.animeList.value.data!
                                                      .score!,
                                              style: ratingPageDetail,
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 2,
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 8),
                                        Text(
                                          ad.animeList.value.data?.animeTitle ??
                                              "-",
                                          style: pageTitle,
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          ad.animeList.value.data?.genre ?? "-",
                                          style: genre,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                  top: 28,
                                  left: 8,
                                  child: GestureDetector(
                                    onTap: () => Navigator.pop(context),
                                    child: Container(
                                        width: 50,
                                        height: 50,
                                        child: const Icon(
                                            Icons.arrow_back_ios_new)),
                                  ))
                            ],
                          ),
                          const Padding(
                            padding: globalPadding,
                            child:
                                Text("Episode List", style: cardSectionTitle),
                          ),
                          Container(
                            // height: MediaQuery.of(context).size.height / 2,
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height / 3,
                            margin: const EdgeInsets.only(left: 28, right: 28),
                            decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(20)),
                            child: ListView.builder(
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                primary: false,
                                itemCount: ad
                                    .animeList.value.data!.episodeList!.length,
                                itemBuilder: (context, i) {
                                  var anime =
                                      ad.animeList.value.data!.episodeList;
                                  return GestureDetector(
                                    onTap: () => Get.to(() => AnimeStream(
                                          slug: anime?[i].episodeSlug,
                                          imgUrl:
                                              ad.animeList.value.data?.imgUrl,
                                        )),
                                    child: Container(
                                      margin: const EdgeInsets.only(
                                          right: 16, left: 16, bottom: 16),
                                      padding: const EdgeInsets.all(10),
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: Colors.white.withOpacity(0.3)),
                                      child: Text(
                                        anime?[i].episodeTitle ?? "-",
                                        style: cardTitle,
                                      ),
                                    ),
                                  );
                                }),
                          )
                        ],
                      ),
              );
            })));
  }
}
