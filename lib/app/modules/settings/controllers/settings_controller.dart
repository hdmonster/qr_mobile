import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lottie/lottie.dart';
import 'package:qr_mobile/app/api/location_api.dart';
import 'package:qr_mobile/app/api/profile_api.dart';
import 'package:qr_mobile/app/components/grey_filled_textfilled.dart';
import 'package:qr_mobile/app/components/primary_button.dart';
import 'package:qr_mobile/app/data/models/location/location_interval_model.dart';
import 'package:qr_mobile/app/routes/app_pages.dart';
import 'package:qr_mobile/app/services/location_service.dart';

import '../../../../constant.dart';

class SettingsController extends GetxController {
  // Profile passwords
  final TextEditingController oldPasswordC = TextEditingController();
  final TextEditingController newPasswordC = TextEditingController();

  // Location Settings
  List<LocationInterval> interval = [];
  RxDouble selectedIntervalIndex = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
    setIntervalLabels();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void setIntervalLabels() {
    LocationApi.getLocationInterval()
        .then((locationInterval) => interval = locationInterval);
  }

  Future<void> saveLocationIntervalPref() async {
    int duration = interval[selectedIntervalIndex.value.toInt()].duration;
    final storage = GetStorage();

    if (storage.read('location') != null) {
      storage.remove('location');
      storage.write('location', {'duration': duration});
    } else {
      storage.write('location', {'duration': duration});
    }

    LocationService.sendPeriodicLocation(duration);
    print('Location will be sent every $duration seconds');
  }

  Future showChangePasswordSheet(BuildContext context) => showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 24, horizontal: 18),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Ganti password akun',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                SizedBox(height: 24),
                GreyFilledTextField(
                  controller: oldPasswordC,
                  hint: 'Password lama',
                  isSecureText: true,
                ),
                SizedBox(height: 15),
                GreyFilledTextField(
                  controller: newPasswordC,
                  hint: 'Password Baru',
                  isSecureText: true,
                ),
                SizedBox(height: 48),
                PrimaryButton(label: 'Ubah Password', onPressed: () {}),
              ],
            ),
          ),
        );
      });

  Future showLocationSheet(BuildContext context) => showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.fromLTRB(18, 18, 18, 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Obx(
                () => Text(
                  'Kirim otomatis lokasi saya setiap ${interval[selectedIntervalIndex.value.toInt()].label}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
              SizedBox(height: 24),
              Obx(
                () => Slider(
                  value: selectedIntervalIndex.value,
                  onChanged: (index) => selectedIntervalIndex.value = index,
                  divisions: 3,
                  max: 3,
                  label:
                      '${interval[selectedIntervalIndex.value.toInt()].label}',
                ),
              ),
              SizedBox(height: 32),
              PrimaryButton(
                  label: 'Simpan',
                  onPressed: () async {
                    await saveLocationIntervalPref();
                    Get.back();
                  })
            ],
          ),
        );
      });

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
