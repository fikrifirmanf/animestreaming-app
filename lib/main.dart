import 'package:flutter/material.dart';
import 'package:fnime_streaming/src/pages/home/main.dart';
import 'package:get/get.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(title: 'Material App', home: HomePage());
  }
}
