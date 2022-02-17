import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../home/views/home_view.dart';
import '../../settings/views/settings_view.dart';
import '../../tasks/views/tasks_list_view.dart';

import '../controllers/main_controller.dart';

class MainView extends GetView<MainController> {
  final screens = [
    HomeView(),
    TasksView(),
    SettingsView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => screens[controller.currentIndex.value]),
      bottomNavigationBar: Obx(() => bottomNavigationBar()),
    );
  }

  BottomNavigationBar bottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedFontSize: 12,
      currentIndex: controller.currentIndex.value,
      onTap: (index) => controller.switchIndex(index),
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Beranda'),
        BottomNavigationBarItem(icon: Icon(Icons.task), label: 'Tugas'),
        BottomNavigationBarItem(
            icon: Icon(Icons.settings), label: 'Pengaturan'),
      ],
    );
  }
}
