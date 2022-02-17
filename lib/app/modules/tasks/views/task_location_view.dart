import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_mobile/app/data/models/task/task_detail_model.dart';
import 'package:qr_mobile/app/modules/tasks/controllers/tasks_controller.dart';
import 'package:qr_mobile/app/modules/tasks/views/sheets/confirm_location_sheet.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../../../constant.dart';

class TaskLocationView extends GetView<TasksController> {
  @override
  Widget build(BuildContext context) {
    final fixedPanelSize = MediaQuery.of(context).size.height * .35;

    return Scaffold(
      body: Stack(
        children: [
          FutureBuilder(
            future: controller.loadTaskDetail(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(),
                      SizedBox(height: 12),
                      Text('Loading task...')
                    ],
                  ),
                );
              }

              var taskDetail = snapshot.data as TaskDetail;

              return buildConfirmLocSheetPanel(
                data: taskDetail,
                maxHeight: fixedPanelSize,
                minHeight: fixedPanelSize,
              );
            },
          ),
          buildBackButton()
        ],
      ),
    );
  }

  Widget buildConfirmLocSheetPanel({
    TaskDetail? data,
    double? maxHeight,
    double? minHeight,
  }) {
    return SlidingUpPanel(
      maxHeight: maxHeight!,
      minHeight: minHeight!,
      body: Container(color: kGrey),
      panelBuilder: (slideController) => ConfirmLocationSheet(data: data!),
    );
  }

  Widget buildBackButton() {
    return Positioned(
      top: 48,
      left: 16,
      child: InkWell(
        splashColor: kLightGrey,
        onTap: () => Get.back(),
        child: Container(
          width: 42,
          height: 42,
          child: Icon(Icons.arrow_back),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(21),
            ),
            boxShadow: [
              BoxShadow(
                  color: kPrimaryColor.withOpacity(.25),
                  offset: Offset(0, 2),
                  blurRadius: 4)
            ],
          ),
        ),
      ),
    );
  }
}
