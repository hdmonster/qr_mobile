import 'package:get/get.dart';
import 'package:qr_mobile/app/api/report_api.dart';
import 'package:qr_mobile/app/data/models/report/report_detail_model.dart';
import 'package:qr_mobile/app/data/models/report/report_list_model.dart';

class ReportsController extends GetxController {
  final argumentData = Get.arguments;

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

  Future loadReportsList() async {
    await Future.delayed(Duration(seconds: 1));

    List<ReportsList> reportLists = await ReportApi.getListReports();

    return reportLists;
  }

  Future<ReportDetail> loadReportDetail() async {
    await Future.delayed(Duration(seconds: 1));

    var reportDetail = await ReportApi.getReportDetail('uid');

    return reportDetail;
  }
}
