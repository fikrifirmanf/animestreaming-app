import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fnime_streaming/src/controllers/anime/anime_streaming_url.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AnimeStreamDetail extends StatefulWidget {
  String? url;
  AnimeStreamDetail({Key? key, required this.url}) : super(key: key);

  @override
  State<AnimeStreamDetail> createState() => _AnimeStreamDetailState();
}

class _AnimeStreamDetailState extends State<AnimeStreamDetail> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  @override
  void initState() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeRight]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final AnimeStreamingUrlController as = Get.put(
        AnimeStreamingUrlController()..fetchAnimeStreamingUrl(widget.url));

    return Scaffold(
      floatingActionButton: IconButton(
        onPressed: () {
          setState(() {
            SystemChrome.setPreferredOrientations(
                [DeviceOrientation.portraitUp]);
          });
          Navigator.pop(context);
        },
        icon: const Icon(Icons.arrow_back_ios_new_rounded),
      ),
      body: SafeArea(
        top: false,
        bottom: false,
        right: false,
        left: false,
        child: Obx(() {
          return SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: as.isLoading.value
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: WebView(
                        initialUrl: as.animeList.value.data?.streamUrl,
                        javascriptMode: JavascriptMode.unrestricted,
                        onWebViewCreated:
                            (WebViewController webViewController) {
                          _controller.complete(webViewController);
                        },
                      ),
                    ));
        }),
      ),
    );
  }
}
