import 'package:get/get.dart';

import '../controllers/profile_controller.dart';
import '../controllers/edit_profile_controller.dart';
import '../controllers/settings_controller.dart';

class SettingsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditProfileController>(
      () => EditProfileController(),
    );
    Get.lazyPut<ProfileController>(
      () => ProfileController(),
    );
    Get.lazyPut<SettingsController>(
      () => SettingsController(),
    );
  }
}
