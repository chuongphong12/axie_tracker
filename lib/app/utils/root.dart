import 'package:axie_tracker/app/modules/home/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../modules/auth/controllers/auth_controller.dart';
import '../modules/auth/login/views/login_view.dart';

class Root extends GetWidget<AuthController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return (controller.user != null) ? HomeView() : LoginView();
    });
  }
}
