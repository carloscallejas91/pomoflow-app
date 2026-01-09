import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:pomoflow/core/services/snack_bar_service.dart';
import 'package:pomoflow/data/datasources/auth_remote_datasource.dart';
import 'package:pomoflow/data/datasources/auth_remote_datasource_impl.dart';
import 'package:pomoflow/data/repositories/auth_repository_impl.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    // Services
    Get.put<SnackBarService>(SnackBarService());

    // External
    Get.lazyPut(() => FirebaseAuth.instance, fenix: true);
    Get.lazyPut(() => GoogleSignIn.instance, fenix: true);

    // Datasource
    Get.lazyPut<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(
        firebaseAuth: Get.find(),
        googleSignIn: Get.find(),
      ),
      fenix: true,
    );

    // Repository
    Get.lazyPut<AuthRepositoryImpl>(
      () => AuthRepositoryImpl(remoteDataSource: Get.find()),
      fenix: true,
    );
  }
}
