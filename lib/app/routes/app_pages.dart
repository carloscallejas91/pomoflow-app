import 'package:get/get.dart';
import 'package:pomoflow/features/auth/ui/auth_screen.dart';
import 'package:pomoflow/features/create/create_binding.dart';
import 'package:pomoflow/features/create/ui/create_screen.dart';
import 'package:pomoflow/features/forgot/forgot_binding.dart';
import 'package:pomoflow/features/forgot/ui/forgot_screen.dart';
import 'package:pomoflow/features/home/home_binding.dart';
import 'package:pomoflow/features/home/ui/home_screen.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.AUTH;

  static final List<GetPage<dynamic>> routes = [
    GetPage(name: Routes.AUTH, page: () => const AuthScreen()),
    GetPage(
      name: Routes.FORGOT_PASSWORD,
      page: () => const ForgotScreen(),
      binding: ForgotBinding(),
    ),
    GetPage(
      name: Routes.CREATE_ACCOUNT,
      page: () => const CreateScreen(),
      binding: CreateBinding(),
    ),
    GetPage(name: Routes.HOME, page: () => const HomeScreen(), binding: HomeBinding()),
  ];
}
