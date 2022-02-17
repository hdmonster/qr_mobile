import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../../constant.dart';

// ignore: must_be_immutable
class PreviewImageFullscreenView extends GetView {
  dynamic data = Get.arguments;

  @override
  Widget build(BuildContext context) {
    final image = data[0];
    final tag = data[1];
    final source = data[2];

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        iconTheme: IconThemeData(color: kPrimaryColor),
        backgroundColor: Colors.white,
        actions: [
          IconButton(onPressed: () => Get.back(), icon: Icon(Icons.close))
        ],
      ),
      body: Hero(
        tag: tag,
        child: source == 'network'
            ? Image.network(
                image,
                fit: BoxFit.cover,
                height: double.infinity,
                width: double.infinity,
                alignment: Alignment.center,
              )
            : Image.file(
                image,
                fit: BoxFit.cover,
                height: double.infinity,
                width: double.infinity,
                alignment: Alignment.center,
              ),
      ),
    );
  }
}
