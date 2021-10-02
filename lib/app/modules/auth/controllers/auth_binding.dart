import 'auth_controller.dart';
import '../../home/controllers/home_controller.dart';
import 'package:get/get.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<AuthController>(
      () => AuthController(),
    );
  }
}
