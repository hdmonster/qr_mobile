import 'package:get/get.dart';

import '../../home/controllers/home_controller.dart';
import '../../settings/controllers/settings_controller.dart';
import '../../tasks/controllers/tasks_controller.dart';
import '../controllers/main_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainController>(
      () => MainController(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<TasksController>(
      () => TasksController(),
    );
    Get.lazyPut<SettingsController>(
      () => SettingsController(),
    );
  }
}
