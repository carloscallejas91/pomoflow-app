import 'package:get/get.dart';
import 'package:pomoflow/features/auth/auth_binding.dart';
import 'package:pomoflow/features/auth/ui/auth_screen.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.AUTH;

  static final List<GetPage<dynamic>> routes = [
    GetPage(
      name: Routes.AUTH, // Quando a rota /auth for chamada...
      page: () => const AuthScreen(), // ...esta é a tela que será exibida...
      binding:
          AuthBinding(), // ...e este é o binding que será executado para preparar os controllers.
    ),
    // GetPage(
    //   name: Routes.TIMER,
    //   page: () => const Scaffold(body: Center(child: Text('Timer Screen'))),
    //   // binding: TimerBinding(),
    // ),
  ];
}
