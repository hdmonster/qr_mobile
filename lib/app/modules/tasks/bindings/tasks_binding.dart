import 'package:get/get.dart';

import 'package:qr_mobile/app/modules/tasks/controllers/evidence_photo_controller.dart';

import '../controllers/tasks_controller.dart';

class TasksBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EvidencePhotoController>(
      () => EvidencePhotoController(),
    );
    Get.lazyPut<TasksController>(
      () => TasksController(),
    );
  }
}
