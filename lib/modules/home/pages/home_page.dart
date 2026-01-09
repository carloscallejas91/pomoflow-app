import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pomoflow/app/ui/widgets/gradient_background_widget.dart';
import 'package:pomoflow/modules/home/controllers/home_controller.dart';
import 'package:pomoflow/modules/home/widgets/drawer_menu_widget.dart';
import 'package:pomoflow/modules/home/widgets/navigation_bar_widget.dart';
import 'package:pomoflow/modules/timer/pages/timer_page.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      const Center(child: TimerPage()),
      const Center(child: Text('Tela de Histórico')),
      const Center(child: Text('Tela de Configurações')),
    ];

    return GradientBackgroundWidget(
      appBar: _buildAppBar(),
      leading: DrawerMenuWidget(),
      bottomNavigationBar: _buildNavigationBar(),
      child: _buildBody(screens),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: Builder(
        builder: (context) {
          return IconButton(
            icon: const Icon(Icons.menu_rounded),
            onPressed: () => Scaffold.of(context).openDrawer(),
            tooltip: 'Abrir menu de navegação',
          );
        },
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.add_task),
          onPressed: controller.openCreateTaskSheet,
        ),
      ],
    );
  }

  Widget _buildNavigationBar() {
    return Obx(
      () => NavigationBarWidget(
        selectedIndex: controller.selectedIndex.value,
        onDestinationSelected: controller.changePage,
      ),
    );
  }

  Widget _buildBody(List<Widget> screens) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24.0,
                vertical: 32.0,
              ),
              child: Obx(() => screens[controller.selectedIndex.value]),
            ),
          ),
        );
      },
    );
  }
}
