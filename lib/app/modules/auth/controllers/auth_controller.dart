import 'package:shared_preferences/shared_preferences.dart';

import '../../../routes/app_pages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final Rxn<User> _user = Rxn<User>();
  final isLogin = false.obs;
  final isSignUp = false.obs;

  String? get user => _user.value?.uid;

  @override
  void onInit() {
    _user.bindStream(_firebaseAuth.authStateChanges());
    super.onInit();
  }

  void login(String email, String password) async {
    try {
      isLogin.value = true;
      UserCredential userCredential =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
      final prefs = await SharedPreferences.getInstance();
      if (userCredential.user != null) {
        isLogin.value = false;
        prefs.setString('user', userCredential.user!.uid);
        await Get.offAllNamed(Routes.HOME);
      }
    } on FirebaseAuthException catch (e) {
      isLogin.value = false;
      if (e.message != null) {
        Get.snackbar(
          'Authentication Fail',
          e.message.toString(),
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } on PlatformException catch (e) {
      isLogin.value = false;
      if (e.message != null) {
        Get.snackbar('Error', e.message.toString());
      }
    }
  }

  void signUp(String email, String password) async {
    try {
      isSignUp.value = true;
      UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
      final prefs = await SharedPreferences.getInstance();
      if (userCredential.user != null) {
        isSignUp.value = false;
        prefs.setString('user', userCredential.user!.uid);
        await Get.offAllNamed(Routes.HOME);
      }
    } on FirebaseAuthException catch (e) {
      isSignUp.value = false;
      if (e.message != null) {
        Get.snackbar(
          'Create new account fail',
          e.message.toString(),
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } on PlatformException catch (e) {
      isSignUp.value = false;
      if (e.message != null) {
        Get.snackbar('Error', e.message.toString());
      }
    }
  }

  void signOut() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      prefs.remove('user');
      await _firebaseAuth
          .signOut()
          .then((value) => Get.offAllNamed(Routes.LOGIN));
    } catch (e) {
      Get.snackbar(
        'Error',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  @override
  void onClose() {}
}
