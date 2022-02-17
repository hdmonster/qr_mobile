// To parse this JSON data, do
//
//     final reportsList = reportsListFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/services.dart';

List<ReportsList> reportsListFromJson(String str) => List<ReportsList>.from(
    json.decode(str).map((x) => ReportsList.fromJson(x)));

String reportsListToJson(List<ReportsList> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ReportsList {
  ReportsList({
    this.reportUid,
    this.createdAt,
    this.status,
  });

  String? reportUid;
  String? createdAt;
  String? status;

  factory ReportsList.fromJson(Map<String, dynamic> json) => ReportsList(
        reportUid: json["report_uid"],
        createdAt: json["created_at"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "report_uid": reportUid,
        "created_at": createdAt,
        "status": status,
      };
}
