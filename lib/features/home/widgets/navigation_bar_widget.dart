import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pomoflow/features/home/controllers/home_controller.dart';

class NavigationBarWidget extends StatelessWidget {
  final HomeController controller;

  const NavigationBarWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => NavigationBar(
        selectedIndex: controller.selectedIndex.value,
        onDestinationSelected: controller.changePage,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        maintainBottomViewPadding: true,
        destinations: [
          NavigationDestination(
            icon: Icon(Icons.timer_outlined),
            selectedIcon: Icon(Icons.timer),
            label: 'Timer',
          ),
          NavigationDestination(
            icon: Icon(Icons.history_outlined),
            selectedIcon: Icon(Icons.history),
            label: 'Histórico',
          ),
          NavigationDestination(
            icon: Icon(Icons.settings_outlined),
            selectedIcon: Icon(Icons.settings),
            label: 'Ajustes',
          ),
        ],
      ),
    );
  }
}
