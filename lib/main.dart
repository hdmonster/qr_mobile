import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/routes/app_pages.dart';
import 'theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init('session');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final session_box = GetStorage('session');

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Quick Response',
      debugShowCheckedModeBanner: false,
      theme: lightThemeData(context),
      initialRoute:
          session_box.read('user') != null ? Routes.MAIN : Routes.SIGNIN,
      getPages: AppPages.routes,
    );
  }
}
