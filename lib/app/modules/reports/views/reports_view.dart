import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:qr_mobile/app/data/models/report/report_list_model.dart';
import 'package:qr_mobile/app/routes/app_pages.dart';

import '../../../../constant.dart';
import '../controllers/reports_controller.dart';

class ReportsView extends GetView<ReportsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Container(
        child: FutureBuilder(
          future: controller.loadReportsList(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            List reports = snapshot.data as List;

            return ListView.separated(
              itemCount: reports.length,
              itemBuilder: (BuildContext ctx, int index) {
                final report = reports[index] as ReportsList;

                return reportItem(
                  'Laporan ${index + 1}',
                  '${report.createdAt}',
                  '${report.status}',
                );
              },
              separatorBuilder: (BuildContext ctx, int index) =>
                  const Divider(),
            );
          },
        ),
      ),
    );
  }

  ListTile reportItem(String title, String datetime, String status) {
    return ListTile(
      title: Text(title),
      subtitle: Text(datetime),
      trailing: Text(
        status,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          color: getStatusColor(status),
        ),
      ),
      onTap: () => Get.toNamed(Routes.REPORT_DETAIL),
    );
  }

  Color getStatusColor(String status) {
    status = status.toLowerCase();

    if (status.contains('diperiksa'))
      return kOrange;
    else if (status.contains('diterima'))
      return kIris;
    else
      return kRed;
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
        'Reports for ' + controller.argumentData[0],
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
