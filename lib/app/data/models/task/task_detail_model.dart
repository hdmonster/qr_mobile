import 'dart:convert';

TaskDetail taskDetailFromJson(String str) =>
    TaskDetail.fromJson(json.decode(str));

String taskDetailToJson(TaskDetail data) => json.encode(data.toJson());

class TaskDetail {
  TaskDetail({
    this.complaintUid,
    this.title,
    this.shortDescription,
    this.guides,
    this.informantName,
    this.informantPhone,
    this.informantLocLatitude,
    this.informantLocLongitude,
    this.issuedAt,
    this.status,
  });

  String? complaintUid;
  String? title;
  String? shortDescription;
  List<String>? guides;
  String? informantName;
  String? informantPhone;
  double? informantLocLatitude;
  double? informantLocLongitude;
  String? issuedAt;
  String? status;

  factory TaskDetail.fromJson(Map<String, dynamic> json) => TaskDetail(
        complaintUid: json["complaint_uid"],
        title: json["title"],
        shortDescription: json["short_description"],
        guides: List<String>.from(json["guides"].map((x) => x)),
        informantName: json["informant_name"],
        informantPhone: json["informant_phone"],
        informantLocLatitude: json["informant_loc_latitude"].toDouble(),
        informantLocLongitude: json["informant_loc_longitude"].toDouble(),
        issuedAt: json["issued_at"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "complaint_uid": complaintUid,
        "title": title,
        "short_description": shortDescription,
        "guides": List<dynamic>.from(guides!.map((x) => x)),
        "informant_name": informantName,
        "informant_phone": informantPhone,
        "informant_loc_latitude": informantLocLatitude,
        "informant_loc_longitude": informantLocLongitude,
        "issued_at": issuedAt,
        "status": status,
      };
}
