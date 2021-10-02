import 'package:get/get.dart';

import '../controllers/account_home_controller.dart';

class AccountHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AccountHomeController>(
      () => AccountHomeController(),
    );
  }
}
