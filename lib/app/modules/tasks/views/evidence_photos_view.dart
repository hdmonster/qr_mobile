import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:qr_mobile/app/modules/tasks/controllers/evidence_photo_controller.dart';
import 'package:qr_mobile/app/routes/app_pages.dart';

import '../../../../constant.dart';

class EvidencePhotosView extends GetView<EvidencePhotoController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: Text(
              'Simpan',
              style: TextStyle(color: kPurple),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              color: kLightGrey,
              alignment: Alignment.center,
              child: Text('Tekan tombol + dibawah\nuntuk menambah foto'),
            ),
          ),
          Expanded(
            flex: 1,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Obx(() => Row(
                      children: [
                        for (var i = 0; i < controller.images!.length; i++)
                          buildImagePreview(
                            preview: controller.images![i],
                            index: i,
                          ),
                        buildAddPhotoButton(context)
                      ],
                    )),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildImagePreview({
    File? preview,
    int? index,
  }) {
    return Container(
      child: Stack(children: [
        GestureDetector(
          onTap: () => Get.toNamed(Routes.EVIDENCE_PHOTO_PREVIEW, arguments: [
            preview,
            index.toString(),
            'file',
          ]),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: Hero(
                tag: index.toString(),
                child: Image.file(
                  preview!,
                  width: 95,
                  height: 95,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: ClipOval(
            child: Material(
              color: kDarkGrey.withOpacity(.8), // Button color
              child: InkWell(
                splashColor: kLightGrey, // Splash color
                onTap: () => controller.removeImageFromList(index!),
                child: SizedBox(
                  width: 24,
                  height: 24,
                  child: Icon(
                    Icons.close,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }

  Widget buildAddPhotoButton(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: DottedBorder(
          color: kPrimaryColor.withOpacity(.5),
          strokeWidth: .5,
          borderType: BorderType.RRect,
          radius: Radius.circular(4),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(4)),
            child: MaterialButton(
              minWidth: 90,
              height: 90,
              color: Colors.white,
              onPressed: () => controller.showImageSource(context),
              child: Icon(Icons.add, color: kGrey),
            ),
          ),
        ),
      ),
    );
  }
}
