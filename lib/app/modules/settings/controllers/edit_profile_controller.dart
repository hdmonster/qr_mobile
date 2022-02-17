import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_mobile/app/data/models/account/profile.dart';

class EditProfileController extends GetxController {
  final TextEditingController emailC = TextEditingController();
  final TextEditingController phoneC = TextEditingController();

  Profile profile = Get.arguments[0];

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    emailC.value = TextEditingValue(text: profile.email);
    phoneC.value = TextEditingValue(text: profile.phone);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    emailC.dispose();
    phoneC.dispose();
  }
}
