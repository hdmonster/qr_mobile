import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stamp_image/stamp_image.dart';

class EvidencePhotoController extends GetxController {
  RxList<File>? images = <File>[].obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void addImageToList(File file) {
    this.images!.add(file);
  }

  void removeImageFromList(int index) {
    this.images!.removeAt(index);
  }

  Future pickImage({ImageSource? source, BuildContext? context}) async {
    try {
      final image = await ImagePicker().pickImage(source: source!);
      if (image == null) return;

      final imageTmp = File(image.path);

      // StampImage.create(
      //   context: context!,
      //   image: imageTmp,
      //   children: [
      //     Positioned(
      //       bottom: 0,
      //       right: 0,
      //       child: Padding(
      //         padding: const EdgeInsets.all(10),
      //         child: Text(
      //           DateTime.now().toString(),
      //           style: TextStyle(
      //             color: Colors.white,
      //             fontSize: 15,
      //           ),
      //         ),
      //       ),
      //     )
      //   ],
      //   onSuccess: (img) => print('i execute you yes'),
      // );

      addImageToList(imageTmp);

      Get.back();
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  Future<ImageSource?> showImageSource(BuildContext context) async {
    return showModalBottomSheet(
      context: context,
      builder: (context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
              leading: Icon(Icons.camera),
              title: Text('Kamera'),
              onTap: () =>
                  pickImage(source: ImageSource.camera, context: context)),
          ListTile(
              leading: Icon(Icons.image),
              title: Text('Galeri'),
              onTap: () =>
                  pickImage(source: ImageSource.gallery, context: context)),
        ],
      ),
    );
  }
}
