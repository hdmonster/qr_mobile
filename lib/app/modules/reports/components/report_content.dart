import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_mobile/app/routes/app_pages.dart';

import 'new_modified_stepper.dart';

class ReportContent extends StatelessWidget {
  const ReportContent({
    Key? key,
    required this.description,
    required this.guides,
    required this.naration,
    required this.coordinates,
    required this.photoUrls,
  }) : super(key: key);

  final String description;
  final String guides;
  final String naration;
  final String coordinates;
  final List<String> photoUrls;

  @override
  Widget build(BuildContext context) {
    return ModifiedStepper(
      modified_steps: [
        ModifiedStep(
          isActive: true,
          title: const Text('Gambaran'),
          content: Container(
            width: double.infinity,
            child: Text(description),
          ),
        ),
        ModifiedStep(
          isActive: true,
          title: const Text('Arahan'),
          content: Container(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(guides),
              ],
            ),
          ),
        ),
        ModifiedStep(
          isActive: true,
          title: const Text('Laporan'),
          content: Container(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Koordinat Lokasi',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  coordinates,
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 28,
                ),
                const Text(
                  'Foto',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 12),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      for (var i = 0; i < photoUrls.length; i++)
                        photoBox(url: photoUrls[i], index: i),
                    ],
                  ),
                ),
                SizedBox(height: 28),
                const Text(
                  'Narasi',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 12),
                Text(
                  naration,
                  style: TextStyle(fontSize: 15),
                  textAlign: TextAlign.justify,
                )
              ],
            ),
          ),
        ),
      ],
      controlsBuilder: (context, controllDetails) => Container(),
    );
  }

  Container photoBox({String? url, int? index}) {
    return Container(
      margin: EdgeInsets.only(right: 5),
      child: GestureDetector(
        onTap: () => Get.toNamed(Routes.EVIDENCE_PHOTO_PREVIEW, arguments: [
          url,
          index.toString(),
          'network',
        ]),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: Hero(
            tag: index.toString(),
            child: Image.network(
              url!,
              width: 72,
              height: 72,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
