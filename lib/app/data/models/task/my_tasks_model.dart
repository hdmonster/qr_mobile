import 'dart:convert';

List<MyTasksList> myTasksListFromJson(String str) => List<MyTasksList>.from(
    json.decode(str).map((x) => MyTasksList.fromJson(x)));

String myTasksListToJson(List<MyTasksList> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MyTasksList {
  MyTasksList({
    this.taskUid,
    this.title,
    this.description,
    this.issued_at,
    this.isInLocation,
    this.isAccepted,
  });

  String? taskUid;
  String? title;
  String? description;
  String? issued_at;
  bool? isInLocation;
  bool? isAccepted;

  factory MyTasksList.fromJson(Map<String, dynamic> json) => MyTasksList(
        taskUid: json["task_uid"],
        title: json["title"],
        description: json["description"],
        issued_at: json["issued_at"],
        isInLocation: json["is_in_location"],
        isAccepted: json["is_accepted"],
      );

  Map<String, dynamic> toJson() => {
        "task_uid": taskUid,
        "title": title,
        "description": description,
        "issued_at": issued_at,
        "is_in_location": isInLocation,
        "is_accepted": isAccepted,
      };
}
