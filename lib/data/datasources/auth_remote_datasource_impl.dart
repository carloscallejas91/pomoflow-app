import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:pomoflow/core/error/exceptions.dart';
import 'package:pomoflow/data/datasources/auth_remote_datasource.dart';
import 'package:pomoflow/data/models/user_model.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final FirebaseAuth firebaseAuth;
  final GoogleSignIn googleSignIn;

  AuthRemoteDataSourceImpl({
    required this.firebaseAuth,
    required this.googleSignIn,
  });

  @override
  Future<UserModel> loginWithGoogle() async {
    try {
      await googleSignIn.initialize();

      final googleUser = await googleSignIn.authenticate();
      final googleAuth = googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
      );

      final userCredential = await firebaseAuth.signInWithCredential(
        credential,
      );

      if (userCredential.user == null) throw AuthException('User is null');

      return UserModel.fromFirebaseUser(userCredential.user!);
    } on FirebaseAuthException catch (e) {
      throw AuthException(e.message ?? 'Google Sign-In Error');
    } catch (e) {
      throw AuthException(e.toString());
    }
  }

  @override
  Future<UserModel> loginWithEmail(String email, String password) async {
    try {
      final userCredential = await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (userCredential.user == null) throw AuthException('User is null');

      return UserModel.fromFirebaseUser(userCredential.user!);
    } on FirebaseAuthException catch (e) {
      throw AuthException(e.message ?? 'Authentication Error');
    }
  }

  @override
  Future<UserModel> registerWithEmail(
    String email,
    String password,
    String name,
  ) async {
    try {
      final userCredential = await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (userCredential.user == null) throw AuthException('User is null');

      await userCredential.user!.updateDisplayName(name);
      await userCredential.user!.reload();

      final updatedUser = firebaseAuth.currentUser;

      return UserModel.fromFirebaseUser(updatedUser!);
    } on FirebaseAuthException catch (e) {
      throw AuthException(e.message ?? 'Registration Error');
    }
  }

  @override
  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await firebaseAuth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw AuthException(e.message ?? 'Password Reset Error');
    }
  }

  @override
  Future<UserModel?> getCurrentUser() async {
    try {
      final user = firebaseAuth.currentUser;
      if (user != null) {
        return UserModel.fromFirebaseUser(user);
      }
      return null;
    } catch (e) {
      throw AuthException(e.toString());
    }
  }

  @override
  Future<void> logout() async {
    try {
      await Future.wait([firebaseAuth.signOut(), googleSignIn.signOut()]);
    } on FirebaseAuthException catch (e) {
      throw AuthException(e.message ?? 'Logout Error');
    } catch (e) {
      throw AuthException(e.toString());
    }
  }
}
