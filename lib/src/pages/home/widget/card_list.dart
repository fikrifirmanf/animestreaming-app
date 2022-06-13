import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fnime_streaming/src/constant/string.dart';

class CardList extends StatelessWidget {
  String? title, episode, slug;
  String? imgUrl;
  CardList(
      {Key? key,
      required this.title,
      required this.episode,
      required this.imgUrl,
      required this.slug})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Stack(children: [
      ShaderMask(
        shaderCallback: (rect) {
          return LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.black.withOpacity(1), Colors.transparent],
          ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
        },
        blendMode: BlendMode.dstIn,
        child: CachedNetworkImage(
          imageBuilder: (context, imageProvider) => Container(
            width: width / 3,
            height: 200,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                )),
          ),
          imageUrl: imgUrl ??
              'https://i.pinimg.com/originals/f7/d1/36/f7d136d44bbad6846e1385711a6a634b.png',
          fit: BoxFit.cover,
        ),
      ),
      Container(
          width: width / 3,
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.transparent,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
                alignment: Alignment.bottomLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      title ?? "-",
                      style: cardTitle,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                    const SizedBox(height: 8),
                    Text(episode ?? "-", style: cardSubtitle),
                    const SizedBox(height: 8)
                  ],
                )),
          )),
      // Positioned(
      //     top: 8,
      //     right: 8,
      //     child: Row(
      //       crossAxisAlignment: CrossAxisAlignment.center,
      //       children: [
      //         Icon(
      //           Icons.star,
      //           color: Colors.yellow,
      //         ),
      //         SizedBox(width: 4.0),
      //         Text('4.5', style: cardTitle)
      //       ],
      //     ))
    ]);
  }
}
