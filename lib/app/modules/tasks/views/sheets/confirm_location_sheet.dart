import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_mobile/app/components/primary_button.dart';
import 'package:qr_mobile/app/data/models/task/task_detail_model.dart';
import 'package:qr_mobile/app/modules/tasks/controllers/tasks_controller.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../constant.dart';
import '../../../../../theme.dart';

class ConfirmLocationSheet extends GetView {
  ConfirmLocationSheet({
    Key? key,
    required this.data,
  }) : super(key: key);

  final TasksController controller = Get.find<TasksController>();
  final TaskDetail data;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: sheetDecoration(),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      child: Container(
        child: Column(
          children: [
            sheetLine(),
            Spacer(flex: 1),
            buildPelaporContainer(
              name: '${data.informantName}',
              phone: '${data.informantPhone}',
            ),
            Divider(
              thickness: .5,
              color: kPrimaryColor.withOpacity(.5),
            ),
            buildLocationContainer(
              locationName: 'Pasar Senggeng',
              locationAddress: 'Jl. Sesaat di keabadian',
            ),
            Spacer(flex: 1),
            Obx(
              () => IgnorePointer(
                ignoring: controller.isLoading.value,
                child: PrimaryButton(
                  label: 'Saya sudah di lokasi',
                  isLoading: controller.isLoading.value,
                  onPressed: () => controller.confirm(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildPelaporContainer({
    String? name,
    String? phone,
  }) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: kRed,
              shape: BoxShape.circle,
            ),
            width: 36,
            height: 36,
            child: Icon(Icons.person_outline, color: kLightGrey),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Pelapor',
                    style: TextStyle(fontSize: 12),
                  ),
                  SizedBox(height: 2),
                  Text(
                    name!,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: ClipOval(
              child: Material(
                color: kPrimaryColor,
                child: InkWell(
                  splashColor: kLightGrey,
                  onTap: () => launch('tel:$phone'),
                  child: SizedBox(
                    height: 32,
                    width: 32,
                    child: Icon(Icons.call, color: kWhite, size: 18),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildLocationContainer({
    String? locationName,
    String? locationAddress,
  }) {
    return Container(
      padding: EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: kOrange,
              shape: BoxShape.circle,
            ),
            width: 36,
            height: 36,
            child: Icon(Icons.map, color: kLightGrey),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    locationName!,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    locationAddress!,
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
