import 'package:get/get.dart';
import 'package:qr_mobile/app/api/profile_api.dart';
import 'package:qr_mobile/app/routes/app_pages.dart';

class ProfileController extends GetxController {
  // Show password text
  final RxBool isShow = true.obs;

  @override
  void onInit() {
    super.onInit();
    setProfileData();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void showPassword() => isShow.value = !isShow.value;

  Future navigateToEditProfile() async {
    var profile = await ProfileApi.getProfile('uid');
    Get.toNamed(
      Routes.EDIT_PROFILE,
      arguments: [profile],
    );
  }

  Future setProfileData() async {
    await Future.delayed(Duration(seconds: 1));

    var profile = await ProfileApi.getProfile('uid');
    return profile;
  }
}
