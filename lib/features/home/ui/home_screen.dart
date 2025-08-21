import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pomoflow/app/ui/widgets/gradient_background_widget.dart';
import 'package:pomoflow/features/home/controllers/home_controller.dart';
import 'package:pomoflow/features/home/widgets/drawer_menu_widget.dart';
import 'package:pomoflow/features/home/widgets/navigation_bar_widget.dart';
import 'package:pomoflow/features/timer/controllers/task_controller.dart';
import 'package:pomoflow/features/timer/ui/timer_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final homeController = Get.find<HomeController>();
    final tasksController = Get.find<TasksController>();

    final List<Widget> screens = [
      const Center(child: TimerScreen()),
      const Center(child: Text('Tela de Histórico')),
      const Center(child: Text('Tela de Configurações')),
    ];

    return GradientBackgroundWidget(
      appBar: _buildAppBar(tasksController),
      leading: DrawerMenuWidget(),
      bottomNavigationBar: NavigationBarWidget(controller: homeController),
      child: _buildBody(homeController, screens),
    );
  }

  AppBar _buildAppBar(TasksController controller) {
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
        IconButton(icon: const Icon(Icons.add_task), onPressed: controller.showCreateTaskListSheet),
      ],
    );
  }

  Widget _buildBody(HomeController controller, List<Widget> screens) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
              child: Obx(() => screens[controller.selectedIndex.value]),
            ),
          ),
        );
      },
    );
  }
}
