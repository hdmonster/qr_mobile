import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_mobile/app/components/describe_textfield.dart';
import 'package:qr_mobile/app/components/dotted_icon_button.dart';
import 'package:qr_mobile/app/components/primary_button.dart';
import 'package:qr_mobile/app/data/models/task/task_detail_model.dart';
import 'package:qr_mobile/app/modules/tasks/controllers/evidence_photo_controller.dart';
import 'package:qr_mobile/app/modules/tasks/controllers/tasks_controller.dart';
import 'package:qr_mobile/app/routes/app_pages.dart';

import '../../../../constant.dart';

class TaskDetailView extends GetView {
  final EvidencePhotoController evidencePhotoC =
      Get.find<EvidencePhotoController>();
  final TasksController controller = Get.find<TasksController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      resizeToAvoidBottomInset: true,
      body: FutureBuilder(
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

          var data = snapshot.data as TaskDetail;

          return Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            child: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minWidth: MediaQuery.of(context).size.width,
                  minHeight: MediaQuery.of(context).size.height * .86,
                ),
                child: IntrinsicHeight(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('${data.title}',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w700)),
                      SizedBox(height: 12),
                      Container(
                          constraints: BoxConstraints(minHeight: 64),
                          child: Text('${data.shortDescription}',
                              style: TextStyle(fontSize: 13))),
                      SizedBox(height: 12),
                      Text('Arahan dari pusat:',
                          style: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.w700)),
                      SizedBox(height: 8),
                      for (var guide in data.guides!)
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 2),
                          child: Text('• $guide'),
                        ),
                      SizedBox(height: 24),
                      DottedLine(
                        dashColor: kPrimaryColor.withOpacity(.6),
                        dashGapLength: 2,
                      ),
                      SizedBox(height: 18),
                      Text(
                        'Deskripsikan situasi',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 12),
                      DescribeTextfield(
                        controller: controller.narrationC,
                        hint: 'Ceritakan situasi terkini',
                      ),
                      SizedBox(height: 16),
                      DottedIconButton(
                        label: 'Tambah Foto',
                        icon: Icons.camera_alt_outlined,
                        onPressed: () => Get.toNamed(Routes.EVIDENCE_PHOTOS),
                      ),
                      SizedBox(height: 16),
                      PrimaryButton(
                        label: 'Tambah Korban/Pelapor',
                        onPressed: () {
                          print('tambah korban');
                        },
                      ),
                      SizedBox(height: 48),
                      Expanded(child: Container()),
                      Container(
                        padding: EdgeInsets.only(top: 8),
                        decoration: BoxDecoration(
                          border: Border(
                            top: BorderSide(
                              color: kPrimaryColor.withOpacity(.2),
                              width: .5,
                            ),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  buildProgressbar(percentage: .3),
                                  Text('Semakin lengkap, semakin baik!',
                                      style: TextStyle(fontSize: 12)),
                                ],
                              ),
                            ),
                            Obx(
                              () => IgnorePointer(
                                ignoring: controller.isLoading.value,
                                child: PrimaryButton(
                                  label: 'Kirim',
                                  variant: 'small',
                                  isLoading: controller.isLoading.value,
                                  onPressed: () async {
                                    String res =
                                        await controller.sendTaskReport();
                                    if (res == 'success') {
                                      controller.showAlertSheet(
                                          context: context,
                                          isSuccess: true,
                                          message: 'Laporan berhasil dikirim!');
                                    } else {
                                      controller.showAlertSheet(
                                          context: context, message: res);
                                    }
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Container buildProgressbar({double? percentage}) {
    return Container(
      margin: EdgeInsets.only(bottom: 4, right: 16),
      height: 5,
      child: ClipRRect(
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
        child: LinearProgressIndicator(
          value: percentage!,
          valueColor: AlwaysStoppedAnimation<Color>(kPrimaryColor),
          backgroundColor: kGrey,
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: Text(
        'Detail Tugas',
        style: TextStyle(
          color: kPrimaryColor,
          fontWeight: FontWeight.w500,
        ),
      ),
      foregroundColor: kPrimaryColor,
      backgroundColor: kWhite,
      bottom: PreferredSize(
        child: Container(color: kPrimaryColor, height: .1),
        preferredSize: Size.fromHeight(.1),
      ),
    );
  }
}
