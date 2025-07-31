import 'package:get/get.dart';
import 'package:pomoflow/features/auth/auth_binding.dart';
import 'package:pomoflow/features/auth/ui/auth_screen.dart';
import 'package:pomoflow/features/forgot/forgot_binding.dart';
import 'package:pomoflow/features/forgot/ui/forgot_screen.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.AUTH;

  static final List<GetPage<dynamic>> routes = [
    GetPage(name: Routes.AUTH, page: () => const AuthScreen(), binding: AuthBinding()),
    GetPage(
      name: Routes.FORGOT_PASSWORD,
      page: () => const ForgotScreen(),
      binding: ForgotBinding(),
    ),
  ];
}
