import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/underlined_textfield.dart';
import '../controllers/edit_profile_controller.dart';
import '../../../../constant.dart';

class EditProfileView extends GetView<EditProfileController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 24, horizontal: 16),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage(controller.profile.avatar),
            ),
            SizedBox(height: 12),
            RichText(
              text: TextSpan(
                style: TextStyle(color: kPrimaryColor),
                children: <TextSpan>[
                  TextSpan(
                    text: controller.profile.name,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextSpan(text: ' | ${controller.profile.instansi}')
                ],
              ),
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.symmetric(vertical: 4, horizontal: 12),
              decoration: BoxDecoration(
                  color: kRed, borderRadius: BorderRadius.circular(12)),
              child: Text(
                controller.profile.role.toUpperCase(),
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: kWhite,
                ),
              ),
            ),
            SizedBox(height: 24),
            Expanded(
              child: Form(
                child: ListView(
                  children: [
                    UnderlinedTextField(
                        label: 'Email', controller: controller.emailC),
                    SizedBox(height: 12),
                    UnderlinedTextField(
                        label: 'No HP', controller: controller.phoneC),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Text(
        'Edit Profil',
        style: TextStyle(
          color: kPrimaryColor,
          fontWeight: FontWeight.w500,
        ),
      ),
      leading: IconButton(
        onPressed: () => Get.back(),
        icon: Icon(Icons.arrow_back, color: kPrimaryColor),
      ),
      actions: [
        IconButton(
          onPressed: () {
            print('Profile saved!');
            Get.back();
          },
          icon: Icon(Icons.check, color: kPrimaryColor),
        )
      ],
      backgroundColor: kWhite,
      bottom: PreferredSize(
        child: Container(color: kPrimaryColor, height: .1),
        preferredSize: Size.fromHeight(.1),
      ),
    );
  }
}
