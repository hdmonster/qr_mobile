import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:qr_mobile/app/api/auth_api.dart';
import 'package:qr_mobile/app/components/grey_filled_textfilled.dart';
import 'package:qr_mobile/app/components/primary_button.dart';
import 'package:qr_mobile/app/routes/app_pages.dart';

import '../../../../constant.dart';
import '../controllers/settings_controller.dart';

class SettingsView extends GetView {
  final SettingsController settingsC = Get.find<SettingsController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Wrap(
        children: ListTile.divideTiles(
          context: context,
          tiles: [
            ListTile(
              title: Text('Profil'),
              subtitle: Text(
                'Ubah informasi pengguna',
              ),
              onTap: () => Get.toNamed(Routes.PROFILE),
            ),
            ListTile(
              title: Text('Ubah Password'),
              onTap: () => settingsC.showChangePasswordSheet(context),
            ),
            ListTile(
              title: Text('Lokasi'),
              subtitle: Text(
                'Ubah interval pengiriman lokasi',
              ),
              onTap: () => settingsC.showLocationSheet(context),
            ),
            ListTile(
              title: Text('Tentang Perangkat'),
              subtitle: Text('Lihat informasi perangkat anda'),
              onTap: () async {
                final deviceInfoPlugin = DeviceInfoPlugin();
                final deviceInfo = await deviceInfoPlugin.deviceInfo;
                final map = deviceInfo.toMap();

                print(map);
              },
            ),
            Container(
              padding: EdgeInsets.only(left: 8),
              alignment: Alignment.centerLeft,
              child: TextButton(
                onPressed: () {
                  if (AuthApi.signOut() == 'success') {
                    Get.offAllNamed(Routes.SIGNIN);
                  } else {
                    settingsC.showAlertSheet(
                      context: context,
                      message: 'Gagal keluar, coba lagi!',
                    );
                  }
                },
                child: Text(
                  'Keluar dari akun',
                  style: TextStyle(color: kRed),
                ),
              ),
            ),
          ],
        ).toList(),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Text(
        'Pengaturan',
        style: TextStyle(
          color: kPrimaryColor,
          fontWeight: FontWeight.w500,
        ),
      ),
      backgroundColor: kWhite,
      bottom: PreferredSize(
        child: Container(color: kPrimaryColor, height: .1),
        preferredSize: Size.fromHeight(.1),
      ),
    );
  }
}
