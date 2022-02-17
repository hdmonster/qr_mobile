import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_mobile/app/components/grey_filled_textfilled.dart';
import 'package:qr_mobile/app/components/primary_button.dart';
import 'package:qr_mobile/app/routes/app_pages.dart';

import '../controllers/signin_controller.dart';

class SigninView extends GetView<SigninController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/logo.png', width: 150, height: 150),
              SizedBox(height: 10),
              Text(
                'Quick Response',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 36),
              GreyFilledTextField(
                controller: controller.usernameC,
                hint: 'Username',
              ),
              SizedBox(height: 12),
              GreyFilledTextField(
                controller: controller.passwordC,
                hint: 'Password',
                isSecureText: true,
              ),
              SizedBox(height: 24),
              PrimaryButton(
                label: 'Masuk',
                onPressed: () async {
                  String res = await controller.signIn();

                  if (res == 'success') {
                    Get.offAllNamed(Routes.MAIN);
                  } else {
                    controller.showAlertSheet(
                      context: context,
                      message: res,
                    );
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
