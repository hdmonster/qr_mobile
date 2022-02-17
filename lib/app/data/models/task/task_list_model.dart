import 'dart:convert';

List<TasksList> tasksListFromJson(String str) =>
    List<TasksList>.from(json.decode(str).map((x) => TasksList.fromJson(x)));

String tasksListToJson(List<TasksList> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TasksList {
  TasksList({
    this.taskUid,
    this.title,
    this.createdAt,
    this.status,
  });

  String? taskUid;
  String? title;
  String? createdAt;
  String? status;

  factory TasksList.fromJson(Map<String, dynamic> json) => TasksList(
        taskUid: json["task_uid"],
        title: json["title"],
        createdAt: json["created_at"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "task_uid": taskUid,
        "title": title,
        "created_at": createdAt,
        "status": status,
      };
}
