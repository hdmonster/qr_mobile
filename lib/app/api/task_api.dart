import 'package:flutter/services.dart';
import 'package:qr_mobile/app/data/models/task/my_tasks_model.dart';
import 'package:qr_mobile/app/data/models/task/task_detail_model.dart';
import 'package:qr_mobile/app/data/models/task/task_list_model.dart';

class TaskApi {
  static final TaskApi _instance = TaskApi._internal();
  TaskApi._internal();

  factory TaskApi() {
    return _instance;
  }

  static Future loadTaskDetail() async {
    String dir = 'assets/data/task_detail.json';

    try {
      final String response = await rootBundle.loadString(dir);
      return taskDetailFromJson(response);
    } catch (e) {
      throw ('Error loading task detail: ' + e.toString());
    }
  }

  static Future loadTasksList() async {
    String dir = 'assets/data/tasks_list.json';

    try {
      final String response = await rootBundle.loadString(dir);
      return tasksListFromJson(response);
    } catch (e) {
      throw ('Error loading list task: ' + e.toString());
    }
  }

  static Future getMyTasks() async {
    String dir = 'assets/data/my_tasks_list.json';

    try {
      final String response = await rootBundle.loadString(dir);
      return myTasksListFromJson(response);
    } catch (e) {
      throw ('Error loading my list task: ' + e.toString());
    }
  }

  static Future<bool> userInLocation() async {
    await Future.delayed(Duration(seconds: 1));
    return true;
  }

  static Future<String> sendTaskReport() async {
    await Future.delayed(Duration(seconds: 3));
    return 'success';
  }
}
