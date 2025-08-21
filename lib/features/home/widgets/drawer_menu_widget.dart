import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DrawerMenuWidget extends StatelessWidget {
  const DrawerMenuWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('Carlos', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                Text('carlos@email.com'),
              ],
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
              Get.back();
            },
          ),
        ],
      ),
    );
  }
}
