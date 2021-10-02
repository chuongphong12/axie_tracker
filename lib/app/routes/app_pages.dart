// ignore_for_file: constant_identifier_names

import 'package:get/get.dart';

import '../modules/account_home/bindings/account_home_binding.dart';
import '../modules/account_home/views/account_home_view.dart';
import '../modules/auth/login/bindings/login_binding.dart';
import '../modules/auth/login/views/login_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.ACCOUNT_HOME,
      page: () => AccountHomeView(),
      binding: AccountHomeBinding(),
    ),
  ];
}
