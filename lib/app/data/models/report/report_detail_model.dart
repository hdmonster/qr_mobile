import 'dart:convert';

import 'package:flutter/services.dart';

ReportDetail reportDetailFromJson(String str) =>
    ReportDetail.fromJson(json.decode(str));

String reportDetailToJson(ReportDetail data) => json.encode(data.toJson());

class ReportDetail {
  ReportDetail({
    this.title,
    this.description,
    this.guides,
    this.coordinates,
    this.narration,
    this.photoUrls,
  });

  String? title;
  String? description;
  String? guides;
  String? coordinates;
  String? narration;
  List<String>? photoUrls;

  factory ReportDetail.fromJson(Map<String, dynamic> json) => ReportDetail(
        title: json["title"],
        description: json["description"],
        guides: json["guides"],
        coordinates: json["coordinates"],
        narration: json["narration"],
        photoUrls: List<String>.from(json["photoUrls"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
        "guides": guides,
        "coordinates": coordinates,
        "narration": narration,
        "photoUrls": List<dynamic>.from(photoUrls!.map((x) => x)),
      };
}
