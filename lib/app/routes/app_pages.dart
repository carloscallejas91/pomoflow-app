import 'package:get/get.dart';
import 'package:pomoflow/modules/auth/bindings/auth_binding.dart';
import 'package:pomoflow/modules/auth/pages/auth_page.dart';
import 'package:pomoflow/modules/create/bindings/create_binding.dart';
import 'package:pomoflow/modules/create/pages/create_page.dart';
import 'package:pomoflow/modules/forgot/bindings/forgot_binding.dart';
import 'package:pomoflow/modules/forgot/pages/forgot_page.dart';
import 'package:pomoflow/modules/home/bindings/home_binding.dart';
import 'package:pomoflow/modules/home/pages/home_page.dart';

part 'app_routes.dart';

class AppPages {
  static const initial = Routes.auth;

  static final List<GetPage<dynamic>> routes = [
    GetPage(
      name: Routes.auth,
      page: () => const AuthPage(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.forgotPassword,
      page: () => const ForgotPage(),
      binding: ForgotBinding(),
    ),
    GetPage(
      name: Routes.createAccount,
      page: () => const CreatePage(),
      binding: CreateBinding(),
    ),
    GetPage(
      name: Routes.home,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
  ];
}
