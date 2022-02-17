import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:qr_mobile/app/data/models/task/task_list_model.dart';
import 'package:qr_mobile/app/routes/app_pages.dart';

import '../../../../constant.dart';
import '../controllers/tasks_controller.dart';

class TasksView extends GetView {
  final TasksController taskC = Get.find<TasksController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Container(
        child: FutureBuilder(
            future: taskC.loadTasksList(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }
              List tasks = snapshot.data as List;

              return ListView.separated(
                itemCount: tasks.length,
                itemBuilder: (BuildContext ctx, int index) {
                  final TasksList task = tasks[index];

                  return taskItem(
                    task.title!,
                    task.createdAt!,
                    task.status!,
                  );
                },
                separatorBuilder: (BuildContext ctx, int index) =>
                    const Divider(),
              );
            }),
      ),
    );
  }

  Widget taskItem(
    String title,
    String datetime,
    String status,
  ) {
    return ListTile(
      title: Text(title),
      subtitle: Text(
        datetime,
        style: TextStyle(
          fontSize: 12,
        ),
      ),
      trailing: Text(
        status,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          color: getStatusColor(status),
        ),
      ),
      onTap: () {
        Get.toNamed(Routes.REPORTS, arguments: [title]);
      },
    );
  }

  Color getStatusColor(String status) {
    status = status.toLowerCase();

    if (status.contains('berjalan'))
      return kGreen;
    else if (status.contains('selesai'))
      return kIris;
    else
      return kRed;
  }

  AppBar buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Text(
        'Tugas',
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
