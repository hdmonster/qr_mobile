import 'package:flutter/services.dart';
import 'package:qr_mobile/app/data/models/report/report_detail_model.dart';
import 'package:qr_mobile/app/data/models/report/report_list_model.dart';

class ReportApi {
  static final ReportApi _instance = ReportApi._internal();
  ReportApi._internal();

  factory ReportApi() {
    return _instance;
  }

  static Future<List<ReportsList>> getListReports() async {
    String dir = 'assets/data/reports_list.json';

    try {
      final String response = await rootBundle.loadString(dir);
      return reportsListFromJson(response);
    } catch (e) {
      throw ('Error loading list reports: ' + e.toString());
    }
  }

  static Future<ReportDetail> getReportDetail(String uid) async {
    String dir = 'assets/data/report_detail.json';

    try {
      final String response = await rootBundle.loadString(dir);
      return reportDetailFromJson(response);
    } catch (e) {
      throw ('Error loading report' + e.toString());
    }
  }
}
