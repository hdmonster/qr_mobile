import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_mobile/app/data/models/report/report_detail_model.dart';
import 'package:qr_mobile/app/modules/reports/components/report_content.dart';
import 'package:qr_mobile/app/modules/reports/controllers/reports_controller.dart';

import '../../../../constant.dart';

class ReportDetailView extends GetView<ReportsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
                future: controller.loadReportDetail(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }
                  var res = snapshot.data! as ReportDetail;

                  return ReportContent(
                    description: '${res.title}. ${res.description}',
                    guides: '${res.guides}',
                    naration: '${res.narration}',
                    coordinates: '${res.coordinates}',
                    photoUrls: res.photoUrls!,
                  );
                }),
          )
        ],
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      leading: IconButton(
        onPressed: Get.back,
        icon: Icon(
          Icons.arrow_back,
          color: kContentColorLightTheme,
        ),
      ),
      title: Text(
        'Laporan',
        style: TextStyle(
          color: kPrimaryColor,
          fontWeight: FontWeight.w500,
        ),
      ),
      backgroundColor: kWhite,
      bottom: PreferredSize(
        child: Container(color: kPrimaryColor, height: .1),
        preferredSize: Size.fromHeight(.1),
      ),
    );
  }
}
