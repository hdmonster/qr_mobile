import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:qr_mobile/app/components/task_card.dart';
import 'package:qr_mobile/app/data/models/task/my_tasks_model.dart';

import '../../../../constant.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppbar(context),
      body: Container(
        margin: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Tugas saya',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: kPrimaryColor.withOpacity(.6),
              ),
            ),
            SizedBox(height: 8),
            Expanded(
              child: FutureBuilder(
                  future: controller.loadMyTasksList(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    }
                    List myTasks = snapshot.data as List;

                    return ListView.builder(
                        itemCount: myTasks.length,
                        itemBuilder: (ctx, index) {
                          final myTask = myTasks[index] as MyTasksList;

                          return TaskCard(
                            title: '${myTask.title}',
                            description: '${myTask.description}',
                            date: '${myTask.issued_at}',
                            isAccepted: myTask.isAccepted!,
                            onPressed: () => myTask.isAccepted!
                                ? controller.viewTask(
                                    '${myTask.taskUid}',
                                    myTask.isInLocation!,
                                  )
                                : controller.acceptTask('${myTask.taskUid}'),
                          );
                        });
                  }),
            ),
          ],
        ),
      ),
    );
  }

  AppBar buildAppbar(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Text(
        'Quick Response',
        style: TextStyle(color: kPrimaryColor, fontWeight: FontWeight.w500),
      ),
      bottom: PreferredSize(
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Obx(
                  () => RichText(
                    text: TextSpan(
                      style: DefaultTextStyle.of(context).style,
                      children: <TextSpan>[
                        TextSpan(text: 'Saya sedang '),
                        TextSpan(
                          text: controller.dutyStatus.value
                              ? 'bertugas'
                              : 'tidak bertugas',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: controller.dutyStatus.value ? kGreen : kRed,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Obx(
                  () => FlutterSwitch(
                    width: 48,
                    height: 25,
                    toggleSize: 18,
                    activeColor: kGreen,
                    value: controller.dutyStatus.value,
                    onToggle: (val) => controller.toggleDutyStatus(val),
                  ),
                ),
              ],
            )),
        preferredSize: Size.fromHeight(40),
      ),
      actions: [
        Icon(
          Icons.location_on_sharp,
          color: kOrange,
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 5, right: 16),
            child: FutureBuilder(
                future: controller.getAddress(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Text('Loading..');
                  } else if (snapshot.connectionState == ConnectionState.done) {
                    return Text(
                      '${snapshot.data}',
                      style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: 12,
                      ),
                    );
                  }

                  return Text(
                    'Loading...',
                    style: TextStyle(
                      color: kPrimaryColor,
                      fontSize: 12,
                    ),
                  );
                }),
          ),
        )
      ],
      backgroundColor: kWhite,
    );
  }
}
