import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pomoflow/modules/home/controllers/home_controller.dart';

class DrawerMenuWidget extends StatelessWidget {
  const DrawerMenuWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Obx(
            () => UserAccountsDrawerHeader(
              accountName: Text(
                controller.user.value?.displayName ?? 'Usuário',
              ),
              accountEmail: Text(
                controller.user.value?.email ?? 'carregando...',
              ),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text(
                  (controller.user.value?.displayName ?? 'U')
                      .substring(0, 1)
                      .toUpperCase(),
                  style: TextStyle(
                    fontSize: 24.0,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.person_outline),
            title: const Text('Meu Perfil'),
            onTap: () {
              Get.back();
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Sair'),
            onTap: () {
              controller.logout();
            },
          ),
        ],
      ),
    );
  }
}
