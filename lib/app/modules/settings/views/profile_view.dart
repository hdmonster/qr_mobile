import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:qr_mobile/app/components/underlined_textfield.dart';
import 'package:qr_mobile/app/data/models/account/profile.dart';
import 'package:qr_mobile/app/modules/settings/controllers/profile_controller.dart';

import '../../../../constant.dart';

class ProfileView extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: FutureBuilder(
          future: controller.setProfileData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }

            var profile = snapshot.data as Profile;

            return Container(
              padding: EdgeInsets.symmetric(vertical: 24, horizontal: 16),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: NetworkImage(profile.avatar),
                  ),
                  SizedBox(height: 12),
                  RichText(
                    text: TextSpan(
                      style: TextStyle(color: kPrimaryColor),
                      children: <TextSpan>[
                        TextSpan(
                          text: profile.name,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        TextSpan(text: ' | ${profile.instansi}')
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 4, horizontal: 12),
                    decoration: BoxDecoration(
                        color: kRed, borderRadius: BorderRadius.circular(12)),
                    child: Text(
                      profile.role.toUpperCase(),
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
                            label: 'Email',
                            initialValue: profile.email,
                            readonly: true,
                          ),
                          SizedBox(height: 12),
                          UnderlinedTextField(
                            label: 'No HP',
                            initialValue: profile.phone,
                            readonly: true,
                          ),
                          SizedBox(height: 12),
                          Obx(
                            () => buildObsecureField(
                                label: 'Password',
                                isShowText: controller.isShow.value,
                                initialValue: profile.password,
                                onPressIcon: () => controller.showPassword()),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            );
          }),
    );
  }

  Widget buildObsecureField({
    String? label,
    String? initialValue,
    bool? isShowText,
    VoidCallback? onPressIcon,
  }) {
    return Container(
      child: Stack(
        alignment: Alignment.centerRight,
        children: [
          TextFormField(
            decoration: InputDecoration(
              labelText: label,
              border: UnderlineInputBorder(),
              focusColor: kPrimaryColor,
            ),
            obscureText: isShowText!,
            initialValue: initialValue,
            readOnly: true,
          ),
          IconButton(
            onPressed: onPressIcon,
            icon: isShowText
                ? Icon(Icons.visibility)
                : Icon(Icons.visibility_off),
          ),
        ],
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Text(
        'Profil Saya',
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
        TextButton(
            onPressed: () async => await controller.navigateToEditProfile(),
            child: Text('Edit Profil'))
      ],
      backgroundColor: kWhite,
      bottom: PreferredSize(
        child: Container(color: kPrimaryColor, height: .1),
        preferredSize: Size.fromHeight(.1),
      ),
    );
  }
}
