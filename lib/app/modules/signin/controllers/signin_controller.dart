import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lottie/lottie.dart';
import 'package:qr_mobile/app/api/auth_api.dart';
import 'package:qr_mobile/app/components/primary_button.dart';

import '../../../../constant.dart';

class SigninController extends GetxController {
  // Controller
  final usernameC = new TextEditingController();
  final passwordC = new TextEditingController();

  // Get storage
  final session_box = GetStorage('session');

  // State
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    print(session_box.read('user'));
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void setLoadingState(state) => this.isLoading = state;

  Future<String> signIn() async {
    String username = usernameC.text;
    String password = passwordC.text;

    if (username == '' || password == '') {
      return 'Isi semua form yang diperlukan!';
    }

    String response = await AuthApi.signIn(username, password);

    if (response == 'success') {
      session_box.write('user', {'username': username, 'password': password});
    }

    return response;
  }

  void showAlertSheet({BuildContext? context, String? message}) {
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
                'assets/lottie/error.json',
                width: 90,
                height: 90,
                repeat: false,
              ),
              SizedBox(height: 24),
              PrimaryButton(
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
