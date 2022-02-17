import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:qr_mobile/app/api/task_api.dart';
import 'package:qr_mobile/app/data/models/task/my_tasks_model.dart';
import 'package:qr_mobile/app/routes/app_pages.dart';
import 'package:qr_mobile/app/services/location_service.dart';

class HomeController extends GetxController {
  RxBool dutyStatus = false.obs;

  @override
  void onInit() {
    super.onInit();
    final session_box = GetStorage('session');

    print(session_box.read('user'));
  }

  @override
  void onReady() {
    super.onReady();
    getAddress();
  }

  @override
  void onClose() {}

  void toggleDutyStatus(status) => dutyStatus.value = status;

  Future<String> getAddress() async {
    final coor = await LocationService.getLocation();

    print(coor.latitude);

    List<Placemark> placemarks =
        await placemarkFromCoordinates(coor.latitude, coor.longitude);

    print(placemarks[0].subLocality);
    return '${placemarks[0].subLocality}';
  }

  Future loadMyTasksList() async {
    await Future.delayed(Duration(seconds: 1));

    List<MyTasksList> myTasksList = await TaskApi.getMyTasks();

    return myTasksList;
  }

  void acceptTask(String uid) {
    print('task accepted');
  }

  void viewTask(String uid, bool isInLocation) {
    isInLocation
        ? Get.toNamed(Routes.TASK_DETAIL, arguments: [uid])
        : Get.toNamed(Routes.TASK_LOCATION, arguments: [uid]);
  }
}
