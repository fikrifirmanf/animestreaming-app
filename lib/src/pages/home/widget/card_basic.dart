import 'package:flutter/material.dart';
import 'package:fnime_streaming/src/constant/string.dart';

class CardBasic extends StatelessWidget {
  String? imgUrl, animeTitle, animeGenre;

  CardBasic({required this.imgUrl, this.animeTitle, this.animeGenre});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.yellow[500],
            boxShadow: [BoxShadow(color: Colors.red)]),
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: NetworkImage(imgUrl ??
                          "https://i.pinimg.com/originals/f7/d1/36/f7d136d44bbad6846e1385711a6a634b.png"),
                      fit: BoxFit.cover))),
          SizedBox(
            width: 10,
          ),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  animeTitle ?? '-',
                  style: cardSeeAllTitle,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(animeGenre ?? '-', style: cardSeeAllTitle),
              ],
            ),
          ),
        ]));
  }
}
