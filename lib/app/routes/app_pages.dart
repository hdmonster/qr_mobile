import 'package:get/get.dart';
import 'package:qr_mobile/app/components/dismiss_keyboard.dart';
import 'package:qr_mobile/app/modules/reports/views/report_detail_view.dart';
import 'package:qr_mobile/app/modules/settings/views/edit_profile_view.dart';
import 'package:qr_mobile/app/modules/settings/views/profile_view.dart';
import 'package:qr_mobile/app/modules/tasks/views/components/preview_image_fullscreen_view.dart';
import 'package:qr_mobile/app/modules/tasks/views/evidence_photos_view.dart';
import 'package:qr_mobile/app/modules/tasks/views/task_detail_view.dart';
import 'package:qr_mobile/app/modules/tasks/views/task_location_view.dart';

import '../../app/modules/home/bindings/home_binding.dart';
import '../../app/modules/home/views/home_view.dart';
import '../../app/modules/main/bindings/main_binding.dart';
import '../../app/modules/main/views/main_view.dart';
import '../../app/modules/reports/bindings/reports_binding.dart';
import '../../app/modules/reports/views/reports_view.dart';
import '../../app/modules/settings/bindings/settings_binding.dart';
import '../../app/modules/settings/views/settings_view.dart';
import '../../app/modules/signin/bindings/signin_binding.dart';
import '../../app/modules/signin/views/signin_view.dart';
import '../../app/modules/tasks/bindings/tasks_binding.dart';
import '../../app/modules/tasks/views/tasks_list_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SIGNIN;

  static final routes = [
    GetPage(
      name: _Paths.MAIN,
      page: () => MainView(),
      binding: MainBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.TASKS,
      page: () => TasksView(),
      binding: TasksBinding(),
    ),
    GetPage(
      name: _Paths.TASK_LOCATION,
      page: () => TaskLocationView(),
      binding: TasksBinding(),
    ),
    GetPage(
      name: _Paths.TASK_DETAIL,
      page: () => DismissKeyboard(child: TaskDetailView()),
      binding: TasksBinding(),
    ),
    GetPage(
      name: _Paths.EVIDENCE_PHOTOS,
      page: () => EvidencePhotosView(),
      binding: TasksBinding(),
    ),
    GetPage(
      name: _Paths.EVIDENCE_PHOTO_PREVIEW,
      page: () => PreviewImageFullscreenView(),
      binding: TasksBinding(),
    ),
    GetPage(
      name: _Paths.REPORTS,
      page: () => ReportsView(),
      binding: ReportsBinding(),
    ),
    GetPage(
      name: _Paths.REPORT_DETAIL,
      page: () => ReportDetailView(),
      binding: ReportsBinding(),
    ),
    GetPage(
      name: _Paths.SETTINGS,
      page: () => SettingsView(),
      binding: SettingsBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      binding: SettingsBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_PROFILE,
      page: () => DismissKeyboard(child: EditProfileView()),
      binding: SettingsBinding(),
    ),
    GetPage(
      name: _Paths.SIGNIN,
      page: () => SigninView(),
      binding: SigninBinding(),
    ),
  ];
}
