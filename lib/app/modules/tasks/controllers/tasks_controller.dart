import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:qr_mobile/app/api/task_api.dart';
import 'package:qr_mobile/app/components/primary_button.dart';
import 'package:qr_mobile/app/data/models/task/task_list_model.dart';
import 'package:qr_mobile/app/routes/app_pages.dart';

import '../../../../constant.dart';

class TasksController extends GetxController {
  final TextEditingController narrationC = TextEditingController();

  // State
  bool isConfirmed = false;
  RxBool isLoading = false.obs;

  // Init Futures

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void setLoadingState(state) => isLoading.value = state;

  void checkUserLocation() async {}

  void confirm() async {
    setLoadingState(true);

    TaskApi.userInLocation().then((res) {
      setLoadingState(false);

      isConfirmed = res;

      Get.offAndToNamed(Routes.TASK_DETAIL);
    });
  }

  Future loadTasksList() async {
    await Future.delayed(Duration(seconds: 1));

    List<TasksList> tasksList = await TaskApi.loadTasksList();
    return tasksList;
  }

  Future loadTaskDetail() async {
    await Future.delayed(Duration(seconds: 1));

    var taskDetail = await TaskApi.loadTaskDetail();
    return taskDetail;
  }

  Future<String> sendTaskReport() async {
    if (narrationC.text == '') {
      return 'Isi semua form yang diperlukan!';
    }

    setLoadingState(true);

    String response = await TaskApi.sendTaskReport();

    setLoadingState(false);
    return response;
  }

  void showAlertSheet(
      {BuildContext? context, bool? isSuccess = false, String? message}) {
    showModalBottomSheet(
      context: context!,
      isDismissible: false,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: kWhite,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8),
              topRight: Radius.circular(8),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                message!,
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 12),
              Lottie.asset(
                isSuccess!
                    ? 'assets/lottie/success-check.json'
                    : 'assets/lottie/error.json',
                width: 90,
                height: 90,
                repeat: false,
              ),
              SizedBox(height: 24),
              isSuccess
                  ? PrimaryButton(
                      label: 'Kembali ke menu',
                      onPressed: () => Get.offAllNamed(Routes.MAIN),
                    )
                  : PrimaryButton(
                      label: 'OK',
                      onPressed: () => Get.back(),
                    )
            ],
          ),
        );
      },
    );
  }
}
